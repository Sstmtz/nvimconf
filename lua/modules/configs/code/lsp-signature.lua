return function()
    require("lsp_signature").setup {
        bind = true,
        doc_lines = 0,
        handler_opts = {
            border = "none",
        },
        floating_window = false,
        floating_window_above_cur_line = true,
        floating_window_off_x = 1,
        floating_window_off_y = 0,
        fix_pos = false,
        hint_enable = true,
        hint_scheme = "Comment",
        hi_parameter = "LspSignatureActiveParameter",
        debug = false,
        toggle_key = "<M-p>",
        toggle_key_flip_floatwin_setting = true,
        select_signature_key = "<M-n>",
        timer_interval = 80,
        check_completion_visible = false,
        transparency = nil, -- disabled by default, allow floating win transparent value 1~100
        wrap = true,
        zindex = 45, -- avoid overlap with nvim.cmp
    }
end
