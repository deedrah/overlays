{ config, pkgs, lib, ... }:
{
  imports = [ ./channel.nix ];

  nix = {
    daemonNiceLevel = 19;
    daemonIONiceLevel = 7;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      keep-env-derivations = true
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d --max-freed $((64 * 1024**3))";
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };


  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  networking.firewall.allowedTCPPortRanges = [ { from = 1024; to = 65000;} ];
  networking.networkmanager.dns = "dnsmasq";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.forwardX11 = true;
  programs.ssh.setXAuthLocation = true;

  programs.command-not-found.enable = true;
  programs.bash.enableCompletion = true;
  programs.zsh.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;


  services.xserver.displayManager.defaultSession = "gnome-xorg";
  services.xserver.desktopManager.gnome = {
    enable = true;
    sessionPath = [ pkgs.chrome-gnome-shell ];
  };
  programs.gpaste.enable = true;
  services.xserver.desktopManager.gnome.extraGSettingsOverridePackages = [ pkgs.gnome3.gpaste pkgs.gnome3.mutter ];
  services.gnome.evolution-data-server.enable = true;

  #services.gnome3.evolution-data-server.plugins = with pkgs; [ gnome3.evolution-rss ];

  systemd.packages = [ pkgs.chrome-gnome-shell ];
  environment.systemPackages = [ pkgs.chrome-gnome-shell pkgs.volume-mixer pkgs.evolution ];
  services.dbus.packages = [ pkgs.chrome-gnome-shell ];
  environment.etc."chromium/native-messaging-hosts/org.gnome.chrome_gnome_shell.json".source = "${pkgs.chrome-gnome-shell}/etc/chromium/native-messaging-hosts/org.gnome.chrome_gnome_shell.json";
  environment.etc."opt/chrome/native-messaging-hosts/org.gnome.chrome_gnome_shell.json".source = "${pkgs.chrome-gnome-shell}/etc/opt/chrome/native-messaging-hosts/org.gnome.chrome_gnome_shell.json";

  services.journald.rateLimitInterval = "0";

  services.fstrim.enable = true;

  systemd.timers.nix-gc.timerConfig.Persistent = true;
  systemd.services.nix-gc.serviceConfig.Type = "oneshot";

  systemd.timers.nix-optimise.timerConfig.Persistent = true;
  systemd.services.nix-optimise = {
    serviceConfig.Type = "oneshot";
    after = [ "nix-gc.service" ];
  };

  systemd.services.fstrim.after = [ "nix-optimise.service" ];

  services.snapper = {
    snapshotInterval = "*-*-* *:0/15:00";
    cleanupInterval = "1h";
    configs = {
      home = {
        subvolume = "/home";
        extraConfig = ''
          TIMELINE_CREATE="yes"
          TIMELINE_CLEANUP="yes"
          TIMELINE_MIN_AGE="28800"
          TIMELINE_LIMIT_HOURLY="0-48"
          TIMELINE_LIMIT_DAILY="0-14"
          TIMELINE_LIMIT_WEEKLY="0-8"
          TIMELINE_LIMIT_MONTHLY="0-3"
          TIMELINE_LIMIT_YEARLY="0-2"
          SYNC_ACL="yes"
        '';
      };
    };
  };

  systemd.services."save-hwclock".wantedBy = lib.mkForce [];

  fonts = {
    enableDefaultFonts = false;
    #enableFontDir = true;
    #enableCoreFonts = true;
    fonts = with pkgs; [
      liberation_ttf_v1
      #liberation_ttf
      freefont_ttf
      #gyre-fonts # TrueType substitutes for standard PostScript fonts
      unifont
    ];
    #fontconfig.penultimate.enable = false;
  };

  environment.extraInit = ''
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
  '';

  system.replaceRuntimeDependencies = with pkgs; [
  #  { original = freetype;
  #    replacement = freetype29;
  #  }
  #   { original = openjdk8;
  #     replacement = openjdk8_clean;
  #   }
  #   { original = gnome3.evolution_data_server;
  #     replacement = gnome3.evolution_data_server_ids;
  #   }
  ];

  nixpkgs.overlays = [ ( import ../mypkgs ) ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.firefox = {
    enableGnomeExtensions = true;
  };

  security.pki.certificateFiles = [
    ./cert/seznamca-kancelar-root.crt
    ./cert/seznamca-logy.crt
    ./cert/seznamca-root.crt
    ./cert/seznamca-server.crt
  ];

  virtualisation.docker = {
    autoPrune.enable = true;
    autoPrune.flags = [ "--volumes" ];
  };

  systemd.timers.docker-prune.timerConfig.Persistent = true;
  systemd.services.docker-prune.before = [ "nix-gc.service" ];

  hardware.pulseaudio.daemon.config = {
    flat-volumes = "no";
  };

  fileSystems."/remote/amour" =
    { device = "ruster:/Amour";
      fsType = "nfs";
      options = [ "user" "noauto" "nofail" "_netdev" "noatime" "x-systemd.automount" "x-systemd.idle-timeout=30min" "lookupcache=positive" ];
    };

  fileSystems."/remote/music" =
    { device = "ruster:/Music";
      fsType = "nfs";
      options = [ "user" "noauto" "nofail" "_netdev" "noatime" "x-systemd.automount" "x-systemd.idle-timeout=30min" "lookupcache=positive" ];
    };

  fileSystems."/remote/download" =
    { device = "ruster:/Download";
      fsType = "nfs";
      options = [ "user" "noauto" "nofail" "_netdev" "noatime" "x-systemd.automount" "x-systemd.idle-timeout=30min" "lookupcache=positive" ];
    };

}
