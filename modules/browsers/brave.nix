{ pkgs, ... }: 

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
    homepageLocation = "https://startpage.com/";
  };
}
