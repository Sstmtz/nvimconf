local settings = require "global.settings"

if settings.packer == "lazy" then
    local lazy = require "_utils.lazy"
    lazy:install_plugins()
elseif settings.packer == "rocks" then
    local rocks = require "_utils.rocks"
    rocks:install_rocks()
end

if not settings.enable_nvchad then
    require "_utils.mappings"
    require "_utils.options"
end

-- vim.cmd [[
-- augroup kitty_mp
--     autocmd!
--     au VimLeave * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=24 margin=0
--     au VimEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
--     au BufEnter * if !empty($KITTY_WINDOW_ID) | :silent !kitty @ set-spacing padding=0 margin=0
-- augroup END
-- ]]
