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

## 🔌 Installation
<p>   请确保在安装之前先备份你先前的neovim配置（这是一种好的习惯），之后克隆安装完毕后，输入nvim后会等待它自动安装后便可以使用了:)。</p>
<p>   可参考下面的命令执行</p>

```git
mv ~/.config/nvim ~/.config/nvim-backup                                                  
git clone https://github.com/STMT017/Neovim-Config ~/.config/nvim       
nvim                                                                       
```
