# Legacy configuration.nix
# This system is now managed by the flake in /etc/nixos.
# Use:
#   sudo nixos-rebuild switch --flake /etc/nixos#elitebook
#
# This file intentionally fails if used directly, to avoid divergence
# between flake-based and legacy configuration.

{ config, pkgs, ... }:

throw "Use 'sudo nixos-rebuild switch --flake /etc/nixos#elitebook' instead of this legacy configuration.nix";
