{ config, ... }:
{
  programs = {
    git = {
      enable = true;
      
      ignores = [ "*~" "*.swp" ];
    
      signing.format = null;
      
      settings = {
        user = {
          name = config.me.fullname;
          email = config.me.email;
        };
        
        init = {
          defaultBranch = "main";
        };

        alias = {
          ci = "commit";
        };
      };
    };

    lazygit.enable = true;
  };
}
