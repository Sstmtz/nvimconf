## Install
<p>   如何安装?</p>

```sh
mv ~/.config/nvim ~/.config/nvim-backup                                 # 备份你自己的neovim配置                
git clone https://github.com/STMT017/Neovim-Config ~/.config/nvim       # 克隆到你nvim配置目录下
nvim  
```

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
