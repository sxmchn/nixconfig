{ config, ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      ignores = [ "*~" "*.swp" ];
      settings = {
        user = {
          name = config.me.fullname;
          email = config.me.email;
        };
        alias = {
          ci = "commit";
        };
      };
    };
    lazygit.enable = true;
  };

}
