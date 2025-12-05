{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      rebuild  = "sudo nixos-rebuild switch --flake /etc/nixos#elitebook";
      hms = "home-manager switch --flake /etc/nixos#gab@elitebook";
      # One-command backup of /etc/nixos to git
      cfgbackup = "cd /etc/nixos && git status && git add . && git commit -m \"nix update $(date +%F_%T)\" && git push";
    };

    # add initContent if you actually need custom commands:
    # initContent = ''
    #   # custom zsh setup here
    # '';
  };
}
