return function()
    require("clangd_extensions").setup {
        -- server = {
        --   on_attach = function(client, bufnr)
        --     require("navigator.lspclient.mapping").setup { client = client, bufnr = bufnr } -- setup navigator keymaps here,
        --     require("navigator.dochighlight").documentHighlight(bufnr)
        --     require("navigator.codeAction").code_action_prompt(bufnr)
        --     -- otherwise, you can define your own commands to call navigator functions
        --   end,
        -- },
        inlay_hints = {
            inline = false,
        },
        ast = {
            --These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },
            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
        },
    }
end
