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

### 常用操作

#### 回滚

1. Run `home-manager generations` to determine which generation you wish to rollback to:

   ```shell
   $ home-manager generations
   2018-01-04 11:56 : id 765 -> /nix/store/kahm1rxk77mnvd2l8pfvd4jkkffk5ijk-home-manager-generation
   2018-01-03 10:29 : id 764 -> /nix/store/2wsmsliqr5yynqkdyjzb1y57pr5q2lsj-home-manager-generation
   2018-01-01 12:21 : id 763 -> /nix/store/mv960kl9chn2lal5q8lnqdp1ygxngcd1-home-manager-generation
   2017-12-29 21:03 : id 762 -> /nix/store/6c0k1r03fxckql4vgqcn9ccb616ynb94-home-manager-generation
   2017-12-25 18:51 : id 761 -> /nix/store/czc5y6vi1rvnkfv83cs3rn84jarcgsgh-home-manager-generation
   …
   ```

2. Copy the Nix store path of the generation you chose, e.g.,

   ```shell
   /nix/store/mv960kl9chn2lal5q8lnqdp1ygxngcd1-home-manager-generation
   ```

   for generation 763.

3. Run the `activate` script inside the copied store path:

   ```shell
   $ /nix/store/mv960kl9chn2lal5q8lnqdp1ygxngcd1-home-manager-generation/activate
   Starting home manager activation

   ```

4. 清理 `generations`

   ```shell
   home-manager expire-generations '-30 minutes'
   nix-collect-garbage
   ```

### nix-env

```
# 包管理
nix-env -qa <name>  # 查询包
nix-env -i <name>   # 安装包
nix-env -e <name>   # 移除包
nix-env -u <name>   # 升级包
nix-env -u          # 升级所有包

# 用户profile版本管理
nix-env --list-generations     # 列出所有版本
nix-env --switch-generation x  # 选择某个版本
nix-env --rollback             # 回退倒上一个版本

# 垃圾回收
nix-env --delete-generations [+5|14d|old]  # 删除旧profile版本
nix-store --gc          # 垃圾回收，引用计数源头在 /nix/var/nix/gcroots
nix-collect-garbage -d  # 删除所有旧版本并执行一次垃圾回收
```

参考文档:

1.  使用文档: https://nix-community.github.io/home-manager/
2.  配置文档: https://nix-community.github.io/home-manager/options.html
3.  参考文档: https://ssine.ink/posts/intro-to-nix/
