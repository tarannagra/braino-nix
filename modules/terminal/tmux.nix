{ config, pkgs, ... }: 

let
  bg = "#1f1f28";
  fg = "#dcd7ba";
  other_bg = "#C28E5C";

  green = "#98bb6c";
  blue = "#7fb4ca";
  magenta = "#957fb8";
  magentaActive = "#a78fd0";
  grayBg = "#252531";
  grayFg = "#727169";
in
{
  programs.tmux = {
    enable = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.dotbar;
        extraConfig = ''
          set -g @tmux-dotbar-position "top"
        '';
      }
      {
        plugin = pkgs.tmuxPlugins.resurrect;
      }
    ];
    extraConfig = ''
      set -g prefix C-s

      set -g status on # off
      set -g status-justify centre
      set -g status-style "bg=${grayBg},fg=${fg}"
      set -g status-left-length 40
      set -g status-right-length 40
      set -g status-interval 5

      set -g status-left "#[bg=${green},fg=${bg},bold] #S #[bg=default,fg=${fg}]"
      set -g status-right "#[bg=${magenta},bold] #{?client_prefix,#[fg=${bg}] PROMPT,#[fg=${bg}] BRAINO} "

      set -g window-status-current-format "#[bg=${blue},fg=${bg},bold] #I:#W #[default]"
      set -g window-status-format "#[fg=${grayFg}]#I:#W#[default]"

      set -g pane-border-style "fg=${grayFg}"
      set -g pane-active-border-style "fg=${blue}"

      set -g message-style "bg=${grayBg},fg=${fg}"
      set -g mode-style "bg=${magentaActive},fg=${bg},bold"

      bind-key b set-option status

      set-option -s escape-time 0
      bind-key "a" run-shell "sesh connect \"$(
        sesh list --icons | fzf-tmux -p 80%,70% \
        --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
        --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
        --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
        --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
        --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
        --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
        --preview-window 'right:55%' \
        --preview 'sesh preview {}'
      )\""
    '';
  };
}
