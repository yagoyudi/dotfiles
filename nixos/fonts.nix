{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      jetbrains-mono
      nerdfonts
      alegreya
      alegreya-sans
      alice
      amiri
      caladea
      cantarell-fonts
      carlito
      comfortaa
      eunomia
      f1_8
      fa_1
      ferrum
      fira
      fira-code
      fira-mono
      fira-sans
      font-awesome
      hackgen-font
      ibm-plex
      inconsolata
      inriafonts
      inter
      iosevka
      jetbrains-mono
      jost
      lato
      liberation-sans-narrow
      liberation_ttf
      libertinus
      material-icons
      medio
      melete
      mona-sans
      mononoki
      montserrat
      nacelle
      overpass
      pecita
      penna
      raleway
      recursive
      roboto
      roboto-mono
      roboto-serif
      roboto-slab
      route159
      seshat
      source-code-pro
      source-sans
      source-sans-pro
      source-serif
      source-serif-pro
      tenderness
      twitter-color-emoji
      unicode-emoji
      vegur
    ];
    fontconfig = {
      defaultFonts = {
        monospace = ["Fira Mono" "Source Code Pro"];
        serif = ["Fira Serif" "Source Serif Pro"];
        sansSerif = ["Fira Sans" "Source Sans Pro"];
        emoji = ["Twitter Color Emoji"];
      };
    };
  };
}
