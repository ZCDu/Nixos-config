{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxKernel.packages.linux_6_1;
    plymouth.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
    offload.enable = true; # 启动了这个下面的2个就必须要配置, 但是问题是我的cpu是amd啊
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  environment.variables."NIXPKGS_NO_GC_PATH" = [
    "${pkgs.linuxPackages_latest.nvidia_x11.src}"
  ];
}
