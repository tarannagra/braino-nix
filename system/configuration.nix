{ config, pkgs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  # Networking
  networking.hostName = "braino";
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Europe/London";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  services.nextdns = {
    enable = true;
    arguments = [ "-config" "3b1643" "-cache-size" "10MB" ];
  };
  services.dnsmasq.enable = true;
  services.gvfs.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.mullvad-vpn.enable = true;
  hardware = {
    graphics.enable = true;
    opengl.enable = true;
    nvidia.open = false;
    bluetooth.enable = true;
    nvidia.modesetting.enable = true;

    # docker
    nvidia-container-toolkit.enable = true;
  };

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.flatpak.enable = true;

  services.displayManager.sddm.enable = true;

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
    options = "caps:swapescape";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.taran = {
    isNormalUser = true;
    description = "taran";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" ];
    shell = pkgs.fish;
  };

  programs.virt-manager.enable = true;
  programs.nix-ld.enable = true;
  programs.fish.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  programs.niri.enable = true;
  programs.gamescope = {
     enable = true;
     capSysNice = true;
  };
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    obsidian
    libgcc
    libnotify
    quickshell
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lexend
  ];
  
  xdg.portal = {
	enable = true;
	extraPortals = with pkgs; [ 
		xdg-desktop-portal-hyprland 
		xdg-desktop-portal-gnome 
		xdg-desktop-portal-gtk 
	];
  };

  system.stateVersion = "25.11";

  fileSystems."/mnt/work" = {
    device = "/dev/disk/by-uuid/8A549048549038C1";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };
  
  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/01D65B840F4996E0";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" ];
  };
}
