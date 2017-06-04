# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  boot.loader.grub.device = "/dev/disk/by-id/ata-SanDisk_Ultra_II_960GB_163801800068"; # or "nodev" for efi only

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7e6171e3-c1ff-4200-b83f-b54af56397f9";
      fsType = "btrfs";
      options = [ "subvol=nixos" "noatime" "autodefrag" ];
    };

  fileSystems."/var/lib/elasticsearch" =
    { device = "/dev/disk/by-uuid/7e6171e3-c1ff-4200-b83f-b54af56397f9";
      fsType = "btrfs";
      options = [ "subvolid=368" "noatime" "autodefrag" "nofail" ];
    };

#  fileSystems."/tmp" =
#    { device = "none";
#      fsType = "tmpfs";
#    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/38d542ab-49a6-4e80-8878-84d2f573926c";
      fsType = "btrfs";
      options = [ "subvol=nixos-boot" "noatime" "autodefrag" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/a4a524e4-c72d-4275-8d87-ac66b365a77d"; }
    ];

  nix.maxJobs = lib.mkDefault 2;
  nix.buildCores = lib.mkDefault 3;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl.extraPackages = [ pkgs.libvdpau-va-gl pkgs.libvdpau ];
  hardware.opengl.extraPackages32 = [ pkgs.libvdpau-va-gl ];
  hardware.opengl.driSupport32Bit = true;

  hardware.pulseaudio.extraConfig = ''
    set-sink-port alsa_output.pci-0000_00_1b.0.analog-stereo analog-output-headphones
    set-sink-mute alsa_output.pci-0000_00_1b.0.analog-stereo 0
  '';

}
