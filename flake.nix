{
  description = "nixos-bobby285271"; # 介绍

# 软件源配置，这里并没有指定到NixOS官方，应该是作者拷贝了一份官方
  inputs.nixpkgs.url = "git+file:///home/bobby285271/nixpkgs?ref=nixos-unstable";

# 输出配置，即NixOS系统配置, 这里的@d感觉和pills5.4的介绍不一样，但是是默认写法，没必要深入
  outputs = { self, nixpkgs, ... } @ inputs:
#作者将配置拆分成了2个文件，并将默认的系统配置改为了profiles文件
# 这里推荐lantian的配置方式，能够依据不同的系统进行统一的管理
    let
      system = "x86_64-linux";
    in
    {
# 这个没必要
      packages."x86_64-linux" = import ./packages.nix {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
      };
# 这个是主要的，但是最好多一层设置如lantian，方便多设备管理
      nixosConfigurations = import ./profiles.nix {
        inherit inputs system;
      };
      # nix build '/path/to/flake#iso', 按这里的意思应该是构建为iso，没必要吧
      # Takes ~1h to build on my laptop
      legacyPackages.${system} = {
        iso = self.nixosConfigurations.iso.config.system.build.isoImage;
      };
    };
}
