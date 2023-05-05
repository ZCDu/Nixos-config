使用Flake进行部署，因此从Flake.nix作为入口进行阅读
profiles:主要的系统配置
package: 没啥必要
desktop:
  default: 这是个好东西，能够自动加载该目录下的所有文件, 类似于lua中的init.lua会自定执行, 但是应该不会执行子文件夹里的文件
  packeages: 安装一些软件
  fonts：字体设置
  fcitx : 设置输入法为fcitx
  candidates : 桌面系统的配置
  patches
  pkgs
programs: 
  default ： 同上
  git
  lamp : mysql 和 httpd
  nvidia-offload : 从这里看，systempackage这个参数是可以多次使用的，并不会覆盖
  packeages : 安装了一堆软件
  python
  virtualisation : docker的配置
  zsh : 相对简陋的zsh设置，auto-suggestion这些都没有，感觉zsh还是自己配置来的更灵活

systems: 
  default
  locale : 语言和时区设置
  misc: 重要
  network : 网络配置，防火墙、IP域名映射
  nixconfig: 重要，这里主要是channel的配置

helper

machines:
  inspiron:
    default : 一致
    boot : boot的配置看起来就很厉害，如果可以我不想配
    hardware : 硬件就更不想配置了
    nixconfig : 这个不知道为什么需要配置
    system : 配置了一下用户不需要sudo就能够执行
  iso

users:
  default : 这个就和之前的default是不一样的，这个用于定义用户, 如用户密码、组、目录等

