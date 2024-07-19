return function()
  local opts = {}
  for _, ft in ipairs { "markdown", "norg", "rmd", "org" } do
    opts[ft] = {
      headline_highlights = {},
      -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
      bullets = {},
      quote_string = false,
    }
    for i = 1, 6 do
      local hl = "Headline" .. i
      vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
      table.insert(opts[ft].headline_highlights, hl)
    end
  end
  return opts
end
