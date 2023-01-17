# home-manager for macos

### 工具链

nix

home-manager

### 修改配置

注意 jeakin 是我的用户名,需要替换 home 脚本内的

```shell
#自己的用户名和路径
home.username = "jeakin";
home.homeDirectory = "/Users/jeakin";
```

### 应用配置

```shell
# 初次使用
nix run nixpkgs#home-manager switch -- --flake .#jeakin
# 安装完 home-manager 以后
home-manager switch --flake .#jeakin
```

参考文档:

1.  使用文档: https://nix-community.github.io/home-manager/
2.  配置文档: https://nix-community.github.io/home-manager/options.html
