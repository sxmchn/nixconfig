{ ... }:

{
  imports = [
    ./gnome.nix
  ];
  services.xserver.enable = true;

  # включить home GUI-модули
  home-manager.users.artme.my.home.gui.enable = true;
}
