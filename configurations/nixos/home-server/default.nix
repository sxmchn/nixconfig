# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{ flake, ... }:

let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.default
    ./configuration.nix
    # Additional packages
    ./packages.nix
    # Power management, bluetooth
    ./hardware-advanced.nix
    # Virtualization
    ./virtualisation.nix
    ./home-assistant.nix
  ];
}
