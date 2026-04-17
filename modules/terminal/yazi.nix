{ config, pkgs, ... }: 

{
  programs.yazi = {
    enable = true;
    shellWrapperName = "yy";
    settings = {
      mgr = {
        ratio = [1 4 3];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        show_symlink = true;
        show_hidden = true;
        linemode = "size"; # show file size by default. includes folder count
      };
    };
    keymap = {
      input.prepend_keymap = [
        { on = ["<C-q>"]; run = "close"; desc = "Close input"; }
      ];
      mgr.prepend_keymap = [
        # forward/backwards directories
        { on = ["<A-h>"]; run = "back"; desc = "Go backwards a folder"; }
        { on = ["<A-l>"]; run = "forward"; desc = "Go forwards a folder"; }

        # defaults
        { on = ["g" "d"]; run = "cd ~/docs/"; desc = "Jump to ~/docs"; }
        { on = ["g" "D"]; run = "cd ~/downloads/"; desc = "Jump to ~/downloads"; }
        { on = ["g" "m"]; run = "cd ~/media/"; desc = "Jump to ~/media"; }
        { on = ["g" "c"]; run = "cd ~/.config/"; desc = "Jump to ~/.config"; }

        # university
        { on = ["u" "c"]; run = "cd ~/docs/university_coursework/"; desc = "Jump to university coursework"; }
        { on = ["u" "w"]; run = "cd ~/docs/university_writeups/"; desc = "Jump to university writeups"; }
        { on = ["u" "a"]; run = "cd ~/docs/university_archive/"; desc = "Jump to university archive"; }
      ];
    };
  };
}
