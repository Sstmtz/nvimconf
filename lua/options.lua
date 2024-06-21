require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

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
