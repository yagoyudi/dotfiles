{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./man-pages.nix
    ./xdg.nix
    ./services.nix
    ./virtualisation.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "swift3";
    useDHCP = lib.mkDefault true;
    extraHosts = ''
      192.168.18.2 homelab
    '';
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowPing = false;
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
      ];
      connectionTrackingModules = [
      ];
    };
  };

  users.users = {
    yf = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        "audio"
        "video"
        "networkmanager"
        "wireshark"
        "libvirtd"
      ];
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
    };
  };

  programs = {
    virt-manager.enable = true;
    wireshark.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr

    # prompt
    starship

    # office suite
    libreoffice

    # c
    gcc
    gnumake

    # go
    go
    gopls # go lsp
    gotools # godoc, etc...
    go-migrate # sql migrations
    mage # make, but in go

    # zig
    zig

    # nix
    nil # nix lsp

    # md
    marksman

    # java
    jre8
    jdk8
    maven

    # python
    python3Full

    # rust
    cargo
    rustc

    # lua
    lua

    # js
    nodejs_23

    # k8s
    kubectl
    kubernetes-helm
    talosctl

    # media
    ffmpeg # convert video
    pulsemixer # audio volume
    mpv # video player
    imv # image viewer

    # archive
    atool
    bzip2
    gzip
    libarchive
    lz4
    lzip
    lzo
    lzop
    p7zip
    rzip
    unzip
    xz
    zip
    zstd

    # CLI
    tree # view in files tree structure
    grim # screenshot
    slurp # select area
    nix-prefetch-github
    brightnessctl # control brightness
    speedtest-go # test network speed
    nmap # scan network
    jq # parse json
    gnupg
    pinentry
    cmake
    libtool
    pandoc
    tmux
    fish
    w3m
    ripgrep
    eza
    bat
    gh
    git
    gopass
    chezmoi
    podman
    zathura

    alacritty
    wireshark

    mako

    # WM
    dwl
    river
    sway

    # text editor
    vim-full
    neovim
    emacs

    dmenu-wayland
    rofi

    swaykbdd # per-window keyboard layout for sway
    wayland-utils # wayland utilities (wayland-info)
    wl-clip-persist # keep wayland clipboard even after programs close
    wl-clipboard # command-line copy/paste utilities
    wf-recorder # record screen
    wlprop # xprop clone for wlroots based compositors
    wvkbd # on-screen keyboard for wlroots
    waypipe
    swaylock
  ];

  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  console.keyMap = "br-abnt2";

  security = {
    pam.services.swaylock = {};
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
