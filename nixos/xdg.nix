{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      wlr = {
        enable = false;
        #enable = true;
      };
      configPackages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
  };
}
