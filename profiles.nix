{ inputs, system, ... }:

let
  specialArgs = { inherit inputs system; };

# 主要的系统配置
  sharedModules = [
    ./desktop
    ./programs
    ./system
  ];
  inspironSharedModules = sharedModules ++ [
    ./machines/inspiron
    ./users/bobby285271
  ];
in
{
# 依据桌面系统定义各自的桌面
  inspiron = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/cinnamon.nix
    ] ++ inspironSharedModules;
  };
  inspiron-pantheon = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/pantheon.nix
    ] ++ inspironSharedModules;
  };
  inspiron-mate = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/mate.nix
    ] ++ inspironSharedModules;
  };
  inspiron-gnome = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/gnome.nix
    ] ++ inspironSharedModules;
  };
  inspiron-test = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/test.nix
    ] ++ inspironSharedModules;
  };
  inspiron-xfce = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/xfce.nix
    ] ++ inspironSharedModules;
  };
  iso = inputs.nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./desktop/candidates/cinnamon.nix
      ./machines/iso
    ] ++ sharedModules;
  };
}
