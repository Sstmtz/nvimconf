## 📚️ Instruction 介绍

&emsp;&emsp;个人日常编写代码使用的Neovim配置，由[NvChad](https://github.com/NvChad/NvChad)配置修改而来。<br>

## ✨ Features 特征

- 一键安装, 开合即用。
- 完美继承了Nvchad精美的UI设计和极快的启动速度。
- 剔除了NvChad原有的部分配置，使得个人可定制化程度更高。
- 集成了大多数热门nvim插件，提供更好的代码编写体验。

## 🌲 Neovim 配置目录树

&emsp;&emsp;我的neovim配置结构如下:

```
nvim
├─ .stylua.toml
├─ init.lua
├─ lazy-lock.json
├─ lua
│  ├─ chadrc.lua
│  ├─ mappings.lua
│  ├─ options.lua
│  ├─ configs             #✨插件配置✨#        
│  │  ├─ dap              
│  │  │  └─ clients/
│  │  ├─ mason/           
│  │  └─ ui/              
│  ├─ plugins/            #✨安装的插件✨#
│  │  ├─ core/
│  │  ├─ libs/
│  │  ├─ other
│  │  ├─ tools/
│  │  └─ ui/
│  └─ utils/              #✨自定义功能✨#
└─ snippets/              #✨代码片段✨#  
```

## 📋 Plugins list 插件列表

&emsp;&emsp;安装的插件大部分存放在plugins目录下,&emsp;并进行简单的分类。一部分ui插件安装来自[NvChad/ui](https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/ui.lua)。<br>
&emsp;&emsp;目前分为 **核心插件(core)**,**未归类插件(others)**,**工具插件(tools)**,**库插件(libs)**,**ui插件(ui)**。

- core
  - 代码补全:&emsp;nvim-cmp
  - 代码诊断:&emsp;nvim-lint
  - 代码格式化:&emsp;conform
  - lsp相关:&emsp;nvim-lspconfig
  - mason相关:&emsp;mason,&emsp;mason-lspconfig,&emsp;mason-nvim-dap,&emsp;mason-tool-installer
  - 文本高亮:&emsp;nvim-treesitter
  - ui美化:&emsp;nvim-tree,&emsp;nvim-telescope
  - ......
- libs 
  - 提供40+独立Lua模块库: &emsp;mini 
  - ......
- other
  - 更好的注释:&emsp;Comment
  - 括号匹配:&emsp;surround
  - 代码诊断定位:&emsp;trouble
  - ......
- tools
  - 内置git GUI: &emsp;lazygit
  - 内置yazi文件管理器: &emsp;yazi
  - 内置ai: &emsp;copilot,&emsp;codeium 
  - ......
- ui 
  - 代码大纲: &emsp;aerial
  - 消息弹窗: &emsp;noice,&emsp;dressing
  - 待办事务: &emsp;todo-comments
  - 精美图标: &emsp;lspkind,&emsp;nvim-web-devicons,&emsp;gitsigns
  - ......

## 📦 Installation 安装

&emsp;&emsp;**⚠️注意：请确保在安装之前先备份你先前的neovim配置（这是一种好的习惯）。** <br>
&emsp;&emsp;安装的具体步骤可参考下面的命令执行:)。

```git
mv ~/.config/nvim ~/.config/nvim-backup
git clone https://github.com/STMT017/Neovim-Config ~/.config/nvim && nvim
```

## ⚙️ Configuration 配置

&emsp;&emsp;确保你熟悉lua的用法和了解本项目结构, 那么你可以在此基础上进行自定义配置。
