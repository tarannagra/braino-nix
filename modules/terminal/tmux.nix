{ config, pkgs, ... }: 

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.resurrect;
      }
      {
        plugin = pkgs.tmuxPlugins.minimal-tmux-status;
        extraConfig = ''
          set -g @minimal-tmux-use-arrow false
          set -g @minimal-tmux-indicator-str "  braino  "
          set -g @minimal-tmux-status top
          set -g status-right-length 40
          set -g status-left-length 40
        '';
      }
    ];
    extraConfig = ''
      set -g prefix C-s

      set -g status on # off

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # alt+n -> move focused pane to index
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5

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

  programs.sesh = {
    enable = true;
  };
}
