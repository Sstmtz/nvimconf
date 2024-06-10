## Neovim 配置目录树
<p>   我的neovim配置结构如下:</p>

```
nvim/
├─ .stylua.toml
├─ init.lua
└─ lua/
   ├─ chadrc.lua        # 自定义个性化设置
   ├─ mappings.lua      # 自定义按键映射
   ├─ options.lua       # 自定义选项配置
   ├─ configs/          # 已安装的插件配置
   └─ plugins/          # 安装的插件
      ├─ core/              # 核心插件
      ├─ other/             # 其他插件
      └─ tools/             # 内置工具插件
```
## Instruction 介绍
&emsp;&emsp;这是我个人日常编写代码使用的Neovim配置。

## Plugins list 插件列表
&emsp;&emsp;安装的插件存放在plugins目录下,&emsp;并根据它们的用途进行简单的分类。<br>
&emsp;&emsp;目前分为 __core(核心插件)__, __other(其他插件)__ 和 __tools(内置工具插件)__。

- core
   - 代码补全:&emsp;nvim-cmp
   - 代码诊断:&emsp;nvim-lint
   - 代码格式化:&emsp;conform
   - LSP:&emsp;nvim-lspconfig
   - LSP托管:&emsp;mason,&emsp;mason-lspconfig,&emsp;none-ls
   - 文本高亮:&emsp;nvim-treesitter
- other
   - 注释:&emsp;Comment 
   - 输入框美化:&emsp;dressing 
   - 括号匹配:&emsp;surround
   - 代码诊断:&emsp;trouble
- tools
   - lazygit   
   - yazi      

## 📦 Installation 安装
&emsp;&emsp;注意:&emsp;请确保在安装之前先备份你先前的neovim配置（这是一种好的习惯）。<br>
&emsp;&emsp;安装的具体步骤可参考下面的命令执行:)。

```git
mv ~/.config/nvim ~/.config/nvim-backup                                                  
git clone https://github.com/STMT017/Neovim-Config ~/.config/nvim && nvim                                                                       
```

## ⚙️ Configuration 配置
