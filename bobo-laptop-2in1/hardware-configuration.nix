# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_5_6;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"
    "hid_microsoft" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.kernelParams = [
  #  "systemd.restore_state=0"
  #  "button.lid_init_state=method"
  #  "snd_hda_intel.dmic_detect=0"
  #  "snd-intel-dspcfg.dsp_driver=1"
  ];

  boot.kernelPatches = [
    {
      name = "sof";
      patch = null;
      extraConfig = ''
        SND_SOC_AC97_CODEC m
        SND_SOC_ADAU1761_I2C m
        SND_SOC_ADAU1761_SPI m
        SND_SOC_ADAU7002 m
        SND_SOC_AK5558 m
        SND_SOC_AMD_ACP m
        SND_SOC_AMD_ACP3x m
        SND_SOC_AMD_CZ_DA7219MX98357_MACH m
        SND_SOC_AMD_CZ_RT5645_MACH m
        SND_SOC_BD28623 m
        SND_SOC_CROS_EC_CODEC m
        SND_SOC_CS35L34 m
        SND_SOC_CS35L35 m
        SND_SOC_CS35L36 m
        SND_SOC_CS42L42 m
        SND_SOC_CS43130 m
        SND_SOC_CX2072X m
        SND_SOC_DMIC m
        SND_SOC_ES7134 m
        SND_SOC_ES8316 m
        SND_SOC_ES8328_I2C m
        SND_SOC_ES8328 m
        SND_SOC_ES8328_SPI m
        SND_SOC_GENERIC_DMAENGINE_PCM y
        SND_SOC_HDAC_HDA m
        SND_SOC_HDAC_HDMI m
        SND_SOC_HDMI_CODEC m
        SND_SOC_INTEL_BDW_RT5677_MACH m
        SND_SOC_INTEL_BROADWELL_MACH m
        SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH m
        SND_SOC_INTEL_BXT_RT298_MACH m
        SND_SOC_INTEL_BYTCR_RT5640_MACH m
        SND_SOC_INTEL_BYTCR_RT5651_MACH m
        SND_SOC_INTEL_BYT_CHT_CX2072X_MACH m
        SND_SOC_INTEL_BYT_CHT_DA7213_MACH m
        SND_SOC_INTEL_BYT_CHT_ES8316_MACH m
        SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH m
        SND_SOC_INTEL_CML_H m
        SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH m
        SND_SOC_INTEL_CML_LP m
        SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH m
        SND_SOC_INTEL_HASWELL m
        SND_SOC_INTEL_HASWELL_MACH m
        SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH m
        SND_SOC_INTEL_CHT_BSW_NAU8824_MACH m
        SND_SOC_INTEL_CHT_BSW_RT5645_MACH m
        SND_SOC_INTEL_CHT_BSW_RT5672_MACH m
        SND_SOC_INTEL_KBL_DA7219_MAX98357A_MACH m
        SND_SOC_INTEL_KBL_DA7219_MAX98927_MACH m
        SND_SOC_INTEL_KBL_RT5660_MACH m
        SND_SOC_INTEL_KBL_RT5663_MAX98927_MACH m
        SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH m
        SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH m
        SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH m
        SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH m
        SND_SOC_INTEL_SKL_RT286_MACH m
        SND_SOC_INTEL_SKYLAKE m
        SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH m
        SND_SOC_INTEL_SOF_RT5682_MACH m
        SND_SOC_INTEL_SST_ACPI m
        SND_SOC_INTEL_SST m
        SND_SOC_INTEL_SST_TOPLEVEL y
        SND_SOC_MAX9759 m
        SND_SOC_MAX98088 m
        SND_SOC_MAX98373 m
        SND_SOC_MAX9867 m
        SND_SOC_MAX98927 m
        SND_SOC_NAU8540 m
        SND_SOC_NAU8824 m
        SND_SOC_PCM1789_I2C m
        SND_SOC_PCM186X_I2C m
        SND_SOC_PCM186X_SPI m

        SND_SOC_PCM3060_I2C m
        SND_SOC_PCM3060_SPI m
        SND_SOC_RL6231 m
        SND_SOC_RT5660 m
        SND_SOC_SIMPLE_AMPLIFIER m
        SND_SOC_SOF_ACPI m
        SND_SOC_SOF_APOLLOLAKE_SUPPORT y
        SND_SOC_SOF_CANNONLAKE_SUPPORT y
        SND_SOC_SOF_COFFEELAKE_SUPPORT y
        SND_SOC_SOF_COMETLAKE_H_SUPPORT y
        SND_SOC_SOF_COMETLAKE_LP_SUPPORT y
        SND_SOC_SOF_ELKHARTLAKE_SUPPORT y
        SND_SOC_SOF_GEMINILAKE_SUPPORT y
        SND_SOC_SOF_HDA_AUDIO_CODEC y
        SND_SOC_SOF_HDA_LINK y
        SND_SOC_SOF_ICELAKE_SUPPORT y
        SND_SOC_SOF_INTEL_TOPLEVEL y
        SND_SOC_SOF_MERRIFIELD_SUPPORT y
        SND_SOC_SOF_PCI m
        SND_SOC_SOF_TIGERLAKE_SUPPORT y
        SND_SOC_SOF_TOPLEVEL y
        SND_SOC_SPDIF m
        SND_SOC_SSM4567 m
        SND_SOC_TAS6424 m
        SND_SOC_TDA7419 m
        SND_SOC_TLV320AIC32X4_I2C m
        SND_SOC_TLV320AIC32X4_SPI m
        SND_SOC_TSCS42XX m
        SND_SOC_TS3A227E m
        SND_SOC_WM8524 m
      '';
    }
  ];

  boot.initrd.luks.devices."nixos" =
    { device = "/dev/disk/by-uuid/ba1da5c5-c0f5-4ea1-ad74-5e168ddf41e9";
      allowDiscards = true;
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9a6fd74c-293b-4190-a458-458421d1a910";
      fsType = "btrfs";
      options = [ "subvol=nixos" "noatime" "autodefrag" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2ECE-55C6";
      fsType = "vfat";
    };


  fileSystems."/tmp" =
    { device = "none";
      fsType = "tmpfs";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 8;
  nix.buildCores = lib.mkDefault 8;

  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.s3tcSupport = true;

  hardware.cpu.intel.updateMicrocode = true;

  hardware.sensor.iio.enable = true;

  hardware.firmware = with pkgs; [ alsa-sof-firmware ];

  services.tlp.enable = true;
  services.tlp.extraConfig = ''
    CPU_SCALING_GOVERNOR_ON_AC=powersave
    CPU_SCALING_GOVERNOR_ON_BAT=powersave
    CPU_ENERGY_PERF_POLICY_ON_AC=balance_performance
    CPU_ENERGY_PERF_POLICY_ON_BAT=balance_power
    CPU_HWP_ON_AC=balance_performance
    CPU_HWP_ON_BAT=balance_power
    ENERGY_PERF_POLICY_ON_AC=balance_performance
    ENERGY_PERF_POLICY_ON_BAT=balance_power
    SCHED_POWERSAVE_ON_AC=1
    SCHED_POWERSAVE_ON_BAT=1

    DISK_DEVICES="nvme0n1"

    USB_AUTOSUSPEND=0
    USB_BLACKLIST="0bda:8153"
  '';

  services.undervolt = {
    enable = true;
    coreOffset = "-60";
  };

  services.thermald = {
    enable = true;
    configFile = ./thermal-conf.xml.default;
  };

}
