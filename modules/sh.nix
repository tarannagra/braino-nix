{ config, lib, pkgs, ... }: 

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set fish_greeting
            zoxide init fish | source
            starship init fish | source
            direnv hook fish | source

            # functions -q pwd_change_environment; or source ~/.config/fish/functions/pwd_change_environment.fish
    '';
    shellAliases = {
      # base aliases
      ls = "eza --header --long --icons";
      tree = "eza --tree";
      e = "$EDITOR";

      # neovim
      nconf = "cd ~/.config/nvim && nvim";

      # home manager
      hconf = "cd ~/.config/home-manager && nvim";
      hms = "home-manager switch --flake '/home/taran/.config/home-manager/'.#braino -b backup";
      ffms = "rm ~/.mozilla/firefox/taran/search.json.mozlz4.backup; hms";

      # zoxide
      cd = "z"; 

      # git specific
      ga = "git add";
      gcom ="git commit -am";
      gpom = "git push origin main";

      # filebot
      filebot-movie = "filebot --db TheMovieDB -non-strict -rename";
      filebot-show = "filebot --db TheMovieDB::TV -non-strict -rename";
    };
    # functions = {
    #   pwd_change_environment = {
    #     onVariable = "PWD";
    #     body = ''
    #       if test "$PWD" = "$__last_pwd"
    #           return
    #       end
    #       set -g __last_pwd "$PWD"
    #
    #       set -l has_venv (test -d .venv; and echo yes)
    #       set -l has_flake (test -f flake.nix; and echo yes)
    #
    #       if test -n "$has_flake"; and test "$__active_env" != nix 
    #
    #       # if test -d ./.venv
    #       #   # if .venv found (from uv), then activate it
    #       #   # echo "Detected .venv"
    #       #   source .venv/bin/activate.fish
    #       #   # set CURRENT_ENVIRONMENT=python
    #       # end
    #     '';
    #   };
    # };
    plugins = [
      { name = "done"; src = pkgs.fishPlugins.done.src; }
    ];
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
