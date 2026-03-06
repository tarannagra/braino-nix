{ config, pkgs, ... }: 

{
  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        # mgr
        ratio = [1 4 3];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        show_symlink = true;
        show_hidden = true;
      };
    };
    keymap = {
      input.prepend_keymap = [
        { on = ["<C-q>"]; run = "close"; }
      ];
      mgr.prepend_keymap = [
        { on = ["g" "d"]; run = "cd ~/docs/"; desc = "Jump to ~/docs"; }
        # { on = ["g" "D"]; run = "cd "; desc = "";}
      ];
    };
  };
}
