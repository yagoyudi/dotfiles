{...}: {
  services = {
    # bluetooth
    blueman.enable = true;

    # logs
    journald = {
      extraConfig = "SystemMaxUse=1G";
    };

    # audio
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    # VPN
    tailscale.enable = true;

    /*
    # DB
    postgresql = {
      enable = true;
      package = pkgs.postgresql_14;
    };
    */
  };
}
