local require_plugin = function(p)
  if Core.plugins[p] ~= nil and not Core.plugins[p].enable then
    return nil
  end
  local ok, plugin = pcall(require, p)
  if ok then
    return plugin
  else
    print('Unable to load ' .. p)
    return nil
  end
end

local packadd_plugin = function(p, return_plugin)
  vim.cmd('packadd! ' .. p)
  if return_plugin == true then
    return require_plugin(p)
  end
end

Core.utils = {
  plugins = {
    require = require_plugin,
    packadd = packadd_plugin,
  },
  keymap = vim.api.nvim_set_keymap,
}
