{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # System-level modules
    ../../modules/system/settings.nix
    ../../modules/system/packages.nix

    # Home Manager as a NixOS module
    inputs.home-manager.nixosModules.home-manager
  ];

  # Host-specific settings
  networking.hostName = "elitebook";

  # Define the main user account. Packages are managed via Home Manager.
  users.users.gab = {
    isNormalUser = true;
    description = "Gabriel";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Home Manager configuration for user gab
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.gab = import ../../modules/home/gab.nix;
  };

  # System state version: keep at the version you first installed.
  system.stateVersion = "25.05";
}
