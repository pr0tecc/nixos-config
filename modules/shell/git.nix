{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Gabriel Gruben";
    userEmail = "gabriel.gruben@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}
