{ config, pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    gparted
    gptfdisk
    # Add further system tools here
  ];

  # System-level programs
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
}
