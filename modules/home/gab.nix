{ config, pkgs, inputs, ... }:

{
  #### Basic home settings ####

  home.username = "gab";
  home.homeDirectory = "/home/gab";

  # First Home Manager version you use. Keep this stable.
  home.stateVersion = "25.05";

  # programs.home-manager.enable = true;

  #### Imports ####

  imports = [
    ../shell/git.nix
    ../shell/zsh.nix
    # ../shell/direnv.nix
  ];

  #### User packages ####

  home.packages = with pkgs; [
    telegram-desktop
    altus

    # Home Manager CLI, pinned to the same input as your module
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.home-manager
    # Add personal tools here
  ];
}
