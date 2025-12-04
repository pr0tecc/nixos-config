{ config, pkgs, lib, ... }:

{
  ##### Bootloader #####
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/efi";
  boot.loader.systemd-boot.xbootldrMountPoint = "/boot";

  ##### Networking #####
  # NetworkManager for network management
  networking.networkmanager.enable = true;

  ##### Nix / flakes #####
  # Enable Nix command and flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ##### Time and locale #####
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT    = "de_DE.UTF-8";
    LC_MONETARY       = "de_DE.UTF-8";
    LC_NAME           = "de_DE.UTF-8";
    LC_NUMERIC        = "de_DE.UTF-8";
    LC_PAPER          = "de_DE.UTF-8";
    LC_TELEPHONE      = "de_DE.UTF-8";
    LC_TIME           = "de_DE.UTF-8";
  };

  ##### Graphical stack #####
  # X11 + Plasma
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Tell Xorg which drivers to use, including DisplayLink
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  # X11 keymap
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  ##### Printing #####
  services.printing.enable = true;

  ##### Audio (PipeWire) #####
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # uncomment if you need JACK
  };

  ##### Nixpkgs #####
  nixpkgs.config.allowUnfree = true;

  # Example firewall settings kept commented, as in the default template.
  # networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ];
  # networking.firewall.enable = true;
}
