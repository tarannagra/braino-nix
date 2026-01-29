{ config, pkgs, ... }: 

{
  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        ratio = [1 4 3];
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        show_symlink = true;
        show_hidden = true;
      };
    };
  };
}
