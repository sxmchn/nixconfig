{
  imports =
    [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	nixpkgs.hostPlatform = "x86_64-linux";
	networking.hostName = "home-server";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
	system.stateVersion = "25.11";
}
