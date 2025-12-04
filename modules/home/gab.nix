{ config, pkgs, ... }:

{
  #### Basic home settings ####

  home.username = "gab";
  home.homeDirectory = "/home/gab";

  # First Home Manager version you use. Keep this stable.
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  #### Imports ####

  imports = [
    ../shell/git.nix
    ../shell/zsh.nix
    # ../shell/direnv.nix
  ];

  #### User packages ####

  home.packages = with pkgs; [
    kdePackages.kate
    paper-plane
    # Add personal tools here
  ];
}
