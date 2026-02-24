{ config, inputs, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "taran";
  home.homeDirectory = "/home/taran";

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  # DO NOT CHANGE
  # NOT EVEN IN THE SLIGHTEST AT ALL DO NOT CHANGE IT
  # IT IS, AND FOREVER WILL BE AT 25.11
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # Wayland Stuff
    xwayland-satellite
    wl-clipboard

    # Web Browsers 
    mullvad-browser
    librewolf-unwrapped

    # Messengers
    element-desktop

    # File managers 
    kdePackages.dolphin
    thunar

    # CLI Tools
    btop
    croc
    p7zip
    ripgrep
    imv
    eza
    localsend
    aria2
    jq
    direnv
    gh
    zoxide
    starship
    fishPlugins.done
    fastfetch
    vdirsyncer

    # C
    gcc
    gnumake

    # Language Servers 
    pyright
    ruff
    nil
    fish-lsp
    tinymist
    marksman
    rust-analyzer
    clang-tools 
    lua-language-server
    nixd
    ty

    # Python
    uv

    # Neovim
    tree-sitter

    # Clipboard
    cliphist

    # Recording
    obs-studio

    # Documents
    zathura
    readest

    # Multimedia
    mpv
    nicotine-plus
    feishin
    gophertube
    kodi-wayland

    # Gaming 
    dolphin-emu
    lutris-free
    r2modman
    prismlauncher

    # Virtualisation
    quickemu

    # Downloaders
    qbittorrent

    # Office
    onlyoffice-desktopeditors

    # Security
    bitwarden-cli
    cryptomator
    ente-auth

    # Networking
    websocat
    bruno
    nextdns
    scrcpy

    # unfree
    burpsuite
    filebot
    beeper
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # ".tmux.conf".text = ''
    #   set -g prefix C-s
    #
    # '';


    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/taran/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    # QT_QPA_PLATFORM = "wayland";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg = {
    # configFile."mimeapps.list".force = true;
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = [ "zathura.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
    };
  };

  programs.fzf = {
    enable = true;
    tmux.enableShellIntegration = true;
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
  programs.git = {
    enable = true;
    settings = {
      user.name = "tarannagra";
      user.email = "tarannagra@proton.me";
    };
  };
  programs.dank-material-shell.enable = true;
}
