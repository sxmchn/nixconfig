{ config, flake, ... }:
{
  imports = [
    flake.inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = import ./nixvim.nix // {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
