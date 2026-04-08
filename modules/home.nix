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
    thunderbird
    teams-for-linux
    gajim

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
    feishin
    grayjay
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
    nextdns
    scrcpy
    postman

    # Crypto
    monero-gui

    # unfree
    vivaldi
    burpsuite
    filebot
    beeper
    sublime3
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
    configFile."yazi/flavors/dms-light.yazi/flavor.toml".text = ''
      [flavor]
      use = "light"

      [which]
      mask  = { bg = "#f9f9f9" }
      cand  = { fg = "#1b1b1b", bold = true }
      rest  = { fg = "#6c6969" }
      desc  = { fg = "#232222" }
      separator_style = { fg = "#ababab" }
    '';

    configFile."yazi/flavors/dms-dark.yazi/flavor.toml".text = ''
      [flavor]
      use = "dark"

      [which]
      mask  = { bg = "#131313" }
      cand  = { fg = "#e2e2e2", bold = true }
      rest  = { fg = "#767676" }
      desc  = { fg = "#c6c6c6" }
      separator_style = { fg = "#ababab" }
    '';
    # for the themes - has to be manual as of now:
    # ya pkg add hankertrix/bluloco-yazi:bluloco-light
    # ya pkg add dangooddd/kanagawa
    configFile."yazi/theme.toml".text = ''
    [flavor]
    dark = "kanagawa"
    light = "bluloco-light"
    '';
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "application/pdf" = [ "zathura.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ];
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
  programs.voxtype = {
    enable = true;
    package = inputs.voxtype.packages.${pkgs.stdenv.hostPlatform.system}.vulkan;
    model.name = "base.en";
    service.enable = true;
    settings = {
      hotkey.enabled = false;
      # hotkey.key = "ALTGR";
      whisper.language = "en";
    };
  };
}
