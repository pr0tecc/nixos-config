{ config, pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    gparted
    gptfdisk
    brave
    displaylink
    # Add further system tools here
  ];

  # System-level programs
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.thunderbird.enable = true;
}
