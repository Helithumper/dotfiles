{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-446d3ade-ce5b-48e3-a10a-b9d3c6b8567e".device = "/dev/disk/by-uuid/446d3ade-ce5b-48e3-a10a-b9d3c6b8567e";
  networking.hostName = "proxima"; # Define your hostname.
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  networking.networkmanager.enable = true;

  #https://nixos.wiki/wiki/I3
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  # Enable the GNOME Desktop Environment.
  services.xserver = {
        enable = true;
	videoDrivers = [ "nvidia" ];
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    # Enable Autologin
    displayManager.autoLogin = {
    	enable = true;
    	autoLogin.user = "user";
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      firefox
      sublime-merge
      chromium
      zsh
    #  thunderbird
    ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     alacritty
     neovim
     gnome3.gnome-tweaks
     gnomeExtensions.pop-shell
     xclip
     nerdfonts

     # Backups
     vorta

     # Monitoring
     htop
     btop
     nvtop

     # media
     vlc
     quodlibet

     # Discord workaround
     # https://github.com/NixOS/nixpkgs/issues/159267
     tela-circle-icon-theme
     (pkgs.makeDesktopItem {
       name = "discord";
       exec = "${pkgs.discord}/bin/discord --use-gl=desktop";
       desktopName = "Discord";
       icon = "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/discord.svg";
     })

     # Gaming
     discord
     lutris
     wine
     winetricks
     protontricks
     vulkan-tools
     gnutls
     openldap
     libgpgerror
     freetype
     sqlite
     libxml2
     xml2
     SDL2
     streamlink
     streamlink-twitch-gui-bin
     prismlauncher

     # Rust utils
     exa
     bat
     tokei
     xsv
     fd
     tealdeer
     du-dust

     # Dev
     git
     tmux
     jq
     git-crypt
     ripgrep
     (import (fetchTarball https://install.devenv.sh/latest)).default

  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "knheggckgoiihginacbkhaalnibhilkk" # notion web clipper
    ];
  };

  virtualisation.docker.enable = true;

  services.openssh.enable = true;
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "server";
  };

  # Experimental features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    allowed-users = [ "user" ];
  };

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  #networking.firewall.allowedUDPPorts = [ ... ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  fileSystems."/nas/media" = {
    device = "//192.168.20.10/media";
    fsType = "cifs";
    options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  fileSystems."/nas/files" = {
    device = "//192.168.20.10/files-bu";
    fsType = "cifs";
    options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  services.borgbackup.jobs."borgbase" = {
    paths = [
      "/var/lib"
      "/srv"
      "/home"
    ];
    exclude = [
      # very large paths
      "/var/lib/docker"
      "/var/lib/systemd"
      "/var/lib/libvirt"
      
      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
      "/home/*/.local/share/Steam"
    ];
    repo = "ssh://m6b32ibr@m6b32ibr.repo.borgbase.com/./repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /root/borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /root/borgbackup/ssh_key";
    compression = "auto,lzma";
    startAt = "daily";
  };
}
