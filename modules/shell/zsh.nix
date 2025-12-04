{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    # quality-of-life options
    enableCompletion = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # Aliases for rebuilds
    shellAliases = {
      # NixOS + HM via the system flake
      nswitch    = "sudo nixos-rebuild switch --flake /etc/nixos#elitebook";

      # Home Manager only, via the same flake
      hmswitch   = "home-manager switch --flake /etc/nixos#gab@elitebook";

      cfg-backup = "cd /etc/nixos && \
        git status && \
        git add . && \
        git commit -m "nix: update $(date +%F_%T)" && \
        git push"
    };

    # Extra commands appended to .zshrc (optional)
    initExtra = ''
      # Put additional custom zsh setup here if needed
    '';
  };
}
