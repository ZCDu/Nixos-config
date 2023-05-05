# ? 是默认参数的意思，当pkgs没有输入的时候，就使用默认参数
{ pkgs ? import <nixpkgs> { } }: {
  # Desktop
  # 这里的2个感觉没啥必要, 第一个主要是定义一些软件需要的icons，第二个是dingtalk
  libreoffice-icon-fixed = pkgs.callPackage ./desktop/pkgs/libreoffice-icon-fixed.nix { };
  dingtalk = pkgs.callPackage ./desktop/pkgs/dingtalk { };
}
