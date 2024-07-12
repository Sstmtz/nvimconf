require "nvchad.options"

-- add yours here!

-- 自动对齐
vim.g.neoformat_basic_format_align = 1
-- 自动删除行尾空格
vim.g.neoformat_basic_format_trim = 1
-- 将制表符替换为空格
vim.g.neoformat_basic_format_retab = 1
-- 只提示错误消息
-- vim.g.neoformat_only_msg_on_error = 1

-- neovide config
if vim.g.neovide then
  -- Theme
  vim.g.neovide_theme = "auto"

  -- Text Gamma and Contrast
  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.1

  -- Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- Floating Shadow
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  -- Idle Refresh Rate 空闲刷新率
  vim.g.neovide_refresh_rate_idle = 5

  -- Remember Previous Window Size
  vim.g.neovide_remember_window_size = true
end

-- codeium options
-- 禁用tab补全(codeium)
vim.g.codeium_no_map_tab = true
-- 禁用codeium自动启动(使用:CodeiumEnable可手动启用)
vim.g.codeium_enabled = true
-- 禁用默认快捷键
vim.g.codeium_disable_bindings = false
