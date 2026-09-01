{ flake, pkgs, ... }:
{
  imports = [
    flake.inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = import ./nixvim.nix { inherit pkgs; } // {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.useGlobalPackages = true;
  };
}
