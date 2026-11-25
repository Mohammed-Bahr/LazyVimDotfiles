-- Hot reload for this Neovim config.
--
-- Saving any file inside ~/.config/nvim applies just the part that changed, the
-- way an IDE picks up a save, instead of making you quit and reopen Neovim:
--
--   lua/config/*.lua          re-required (options, keymaps, autocmds, ...)
--   lua/plugins/*.lua         lazy re-reads all specs and reloads the plugins
--                             declared in the saved file
--   lua/Themes/**, notiondark active colourscheme re-sourced
--
-- Turn it off with:  vim.g.config_hot_reload = false
-- Mute success toasts: vim.g.config_hot_reload_notify = false

local M = {}

local config_dir = vim.fn.fnamemodify(vim.fn.stdpath("config"), ":p")

-- Plugins that must not be reloaded in place: reloading either of them would
-- tear down the plugin manager or LazyVim's own config.
local core = { ["lazy.nvim"] = true, ["LazyVim"] = true }

local timer ---@type uv_timer_t?

local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "Config reload" })
end

local function notify_success(msg)
  if vim.g.config_hot_reload_notify ~= false then
    notify(msg)
  end
end

---Path relative to the config dir, e.g. "lua/config/options.lua".
---@param path string
local function relative(path)
  return path:sub(#config_dir + 1)
end

---Module name for a lua file in the config dir, or nil.
---@param path string
local function module_name(path)
  local rel = relative(path)
  if not rel:match("^lua/.+%.lua$") then
    return nil
  end
  return (rel:gsub("^lua/", ""):gsub("%.lua$", ""):gsub("/", "."))
end

---Drop a module and everything below it from the require cache.
---@param prefix string
local function unload(prefix)
  for name in pairs(package.loaded) do
    if name == prefix or name:sub(1, #prefix + 1) == prefix .. "." then
      package.loaded[name] = nil
      package.preload[name] = nil
    end
  end
end

---Re-source the active colourscheme so edited highlight files are picked up.
local function reload_colorscheme()
  local name = vim.g.colors_name
  if not name then
    return
  end
  unload("notiondark")
  local ok, err = pcall(vim.cmd.colorscheme, name)
  if not ok then
    notify(("Colourscheme %q failed: %s"):format(name, err), vim.log.levels.ERROR)
  end
end

---Collect the plugin names declared in a spec file by running it the same way
---lazy does. Returns nil plus the syntax/runtime error when the file is broken,
---so a bad save is reported instead of silently ignored.
---@param path string
---@return table<string, true>? names, string? err
local function spec_plugin_names(path)
  local chunk, err = loadfile(path)
  if not chunk then
    return nil, err
  end
  local ok, spec = pcall(chunk)
  if not ok then
    return nil, spec
  end
  if type(spec) ~= "table" then
    return {}
  end

  local names = {}
  local function walk(t)
    if type(t) ~= "table" then
      return
    end
    if type(t.name) == "string" then
      names[t.name] = true
    end
    -- "owner/repo" -> "repo" (lazy names a plugin after the repo by default)
    if type(t[1]) == "string" and t[1]:match("^[%w%-_%.]+/[%w%-_%.]+$") then
      names[(t[1]:gsub("/$", ""):match("([^/]+)$"))] = true
    end
    for k, v in pairs(t) do
      if type(k) == "number" and type(v) == "table" then
        walk(v)
      end
    end
  end
  walk(spec)
  return names
end

---@param path string
local function reload_plugin_spec(path)
  local names, err = spec_plugin_names(path)
  if not names then
    notify(("Spec error in %s:\n%s"):format(relative(path), err), vim.log.levels.ERROR)
    return
  end

  -- Re-read every spec file from disk (lazy loadfile()s them, so this works
  -- without a restart). Missing plugins are reported rather than half-loaded.
  local ok, load_err = pcall(function()
    require("lazy.core.plugin").load()
  end)
  if not ok then
    notify("Could not re-read plugin specs:\n" .. tostring(load_err), vim.log.levels.ERROR)
    return
  end

  local Config = require("lazy.core.config")
  local Loader = require("lazy.core.loader")
  local reloaded = {}

  for name in pairs(names) do
    local plugin = Config.plugins[name]
    if plugin and not core[name] then
      if plugin._.installed == false then
        notify(("%s is not installed yet — run :Lazy sync"):format(name), vim.log.levels.WARN)
      else
        local rok, rerr = pcall(Loader.reload, plugin)
        if rok then
          reloaded[#reloaded + 1] = name
        else
          notify(("Reloading %s failed:\n%s"):format(name, rerr), vim.log.levels.ERROR)
        end
      end
    end
  end

  -- A `colorscheme = "..."` change lives in the LazyVim spec, which we never
  -- reload; apply it directly when the saved file actually mentions one.
  local lines = vim.fn.readfile(path)
  if table.concat(lines, "\n"):find("colorscheme", 1, true) then
    local wanted = Config.plugins["LazyVim"] and Config.plugins["LazyVim"].opts.colorscheme
    if wanted and vim.g.colors_name ~= wanted then
      pcall(vim.cmd.colorscheme, wanted)
    end
  end

  if #reloaded > 0 then
    notify_success(("Reloaded %s from %s"):format(table.concat(reloaded, ", "), relative(path)))
  else
    notify_success("Reloaded plugin specs from " .. relative(path))
  end
end

---@param modname string
local function reload_config_module(modname)
  if modname == "config.lazy" then
    notify("lua/config/lazy.lua changed — restart Neovim to apply that file.", vim.log.levels.WARN)
    return
  end

  unload(modname)
  local ok, err = pcall(require, modname)
  if not ok then
    notify(("Error while reloading %s:\n%s"):format(modname, err), vim.log.levels.ERROR)
    return
  end
  notify_success("Reloaded " .. modname)
end

---Apply the change for one saved file.
---@param path string absolute path
function M.reload(path)
  if vim.g.config_hot_reload == false then
    return
  end

  local rel = relative(path)

  if rel:match("^lua/[Tt]hemes/") or rel:match("^lua/notiondark/") then
    reload_colorscheme()
    notify_success("Reloaded colourscheme from " .. rel)
    return
  end

  local modname = module_name(path)
  if modname and (modname == "plugins" or modname:sub(1, 8) == "plugins.") then
    reload_plugin_spec(path)
  elseif modname then
    reload_config_module(modname)
  elseif rel == "init.lua" then
    notify("init.lua changed — restart Neovim to apply that file.", vim.log.levels.WARN)
  end
end

---Reload the pieces LazyVim loads for us, plus the colourscheme.
function M.reload_all()
  for _, mod in ipairs({ "config.options", "config.keymaps", "config.autocmds" }) do
    unload(mod)
    local ok, err = pcall(require, mod)
    if not ok then
      notify(("Error while reloading %s:\n%s"):format(mod, err), vim.log.levels.ERROR)
    end
  end
  reload_colorscheme()
  notify_success("Reloaded options, keymaps, autocmds and colourscheme")
end

function M.setup()
  local group = vim.api.nvim_create_augroup("ConfigHotReload", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    callback = function(args)
      local path = vim.fn.fnamemodify(args.file, ":p")
      if path:sub(1, #config_dir) ~= config_dir then
        return
      end
      if vim.bo[args.buf].buftype ~= "" then
        return
      end

      -- Debounce: a write can fire more than once, and reloading mid-write is
      -- pointless. 150ms keeps it feeling instant.
      if timer then
        timer:stop()
        timer:close()
      end
      timer = vim.uv.new_timer()
      timer:start(150, 0, function()
        vim.schedule(function()
          M.reload(path)
        end)
      end)
    end,
  })

  vim.api.nvim_create_user_command("ConfigReload", function()
    M.reload_all()
  end, { force = true, desc = "Reload the Neovim config from disk" })

  return M
end

-- Register on load. Re-requiring this module (i.e. saving this file) therefore
-- also replaces the autocmd with the freshly loaded code.
M.setup()

return M
