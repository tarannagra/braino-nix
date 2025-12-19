{ config, lib, pkgs, ... }: 

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      background_blur = "25";
      background_opacity = "0.9";
      copy_on_select = true;
      enable_audio_bell = false;
      font_family = "JetBrainsMono Nerd Font";
      font_size = "14.0";
      include = "~/.config/kitty/dank-theme.conf";
      # extraConfig = ''
      #   include ~/.config/kitty/dank-theme.conf
      # '';
    };
  };
}
