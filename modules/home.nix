{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "taran";
  home.homeDirectory = "/home/taran";

  # DO NOT CHANGE
  # NOT EVEN IN THE SLIGHTEST AT ALL DO NOT CHANGE IT
  # IT IS, AND FOREVER WILL BE AT 25.11
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # general
    xwayland-satellite
    mullvad-vpn
    nextdns
    cliphist
    wl-clipboard
    obs-studio
    mpv
    ripgrep
    feishin
    quickemu
    qutebrowser
    librewolf-unwrapped
    imv
    lutris-free
    eza
    localsend
    keepassxc
    r2modman

    gcc
    gnumake
    tree-sitter
    gh

    # programming related
    pyright
    ruff
    nil
    fish-lsp
    tinymist
    marksman
    rust-analyzer
    lua-language-server
    nixd

    # terminal related
    kitty
    zoxide
    tmux
    starship
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

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
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf.enable = true;
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set fish_greeting
            zoxide init fish | source
            starship init fish | source
    '';
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
  programs.yazi.enable = true;
  programs.fuzzel.enable = true;
  programs.vesktop = {
    enable = true;
    vencord.settings = {
      autoUpdate = true;
    };
  };
  programs.dankMaterialShell = {
    enable = true;
    # niri = {
    #     # enableSpawn = true;
    #     enableKeybinds = false;
    # };
  };
}
