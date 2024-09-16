local M = {}

---@class palette
---@field rosewater string
---@field flamingo string
---@field mauve string
---@field pink string
---@field red string
---@field maroon string
---@field peach string
---@field yellow string
---@field green string
---@field sapphire string
---@field blue string
---@field sky string
---@field teal string
---@field lavender string
---@field text string
---@field subtext1 string
---@field subtext0 string
---@field overlay2 string
---@field overlay1 string
---@field overlay0 string
---@field surface2 string
---@field surface1 string
---@field surface0 string
---@field base string
---@field mantle string
---@field crust string
---@field none "NONE"

---@type nil|palette
local palette = nil

-- Indicates if autocmd for refreshing the builtin palette has already been registered
---@type boolean
local _has_autocmd = false

---Initialize the palette
---@return palette
local function init_palette()
    -- Reinitialize the palette on event `ColorScheme`
    if not _has_autocmd then
        _has_autocmd = true
        vim.api.nvim_create_autocmd("ColorScheme", {
            group = vim.api.nvim_create_augroup("__builtin_palette", { clear = true }),
            pattern = "*",
            callback = function()
                palette = nil
                init_palette()
                -- Also refresh hard-coded hl groups
                M.gen_alpha_hl()
                M.gen_lspkind_hl()
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end

    if not palette then
        palette = {
            rosewater = "#DC8A78",
            flamingo = "#DD7878",
            mauve = "#CBA6F7",
            pink = "#F5C2E7",
            red = "#E95678",
            maroon = "#B33076",
            peach = "#FF8700",
            yellow = "#F7BB3B",
            green = "#AFD700",
            sapphire = "#36D0E0",
            blue = "#61AFEF",
            sky = "#04A5E5",
            teal = "#B5E8E0",
            lavender = "#7287FD",

            text = "#F2F2BF",
            subtext1 = "#BAC2DE",
            subtext0 = "#A6ADC8",
            overlay2 = "#C3BAC6",
            overlay1 = "#988BA2",
            overlay0 = "#6E6B6B",
            surface2 = "#6E6C7E",
            surface1 = "#575268",
            surface0 = "#302D41",

            base = "#1D1536",
            mantle = "#1C1C19",
            crust = "#161320",
        }

        palette = vim.tbl_extend("force", { none = "NONE" }, palette, require("global.settings").palette_overwrite)
    end

    return palette
end

---Generate universal highlight groups
---@param overwrite palette? @The color to be overwritten | highest priority
---@return palette
function M.get_palette(overwrite)
    if not overwrite then
        return vim.deepcopy(init_palette())
    else
        return vim.tbl_extend("force", init_palette(), overwrite)
    end
end

-- NOTE: If the active colorscheme isn't `catppuccin`, this function won't overwrite existing definitions
---Sets a global highlight group.
---@param name string @Highlight group name, e.g. "ErrorMsg"
---@param foreground string @The foreground color
---@param background? string @The background color
---@param italic? boolean
local function set_global_hl(name, foreground, background, italic)
    vim.api.nvim_set_hl(0, name, {
        fg = foreground,
        bg = background,
        italic = italic == true,
    })
end

function M.gen_alpha_hl()
    local colors = M.get_palette()

    set_global_hl("AlphaHeader", colors.blue)
    set_global_hl("AlphaButtons", colors.green)
    set_global_hl("AlphaShortcut", colors.pink, nil, true)
    set_global_hl("AlphaFooter", colors.yellow)
end

return M
