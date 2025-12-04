{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # New-style configuration via `settings`
    settings = {
      user.name = "Gabriel Gruben";
      user.email = "gabriel.gruben@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}

