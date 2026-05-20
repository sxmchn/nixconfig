{
  imports =
    [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
    ];
	boot.loader.grub.device = "/dev/vda";

	nixpkgs.hostPlatform = "x86_64-linux";
	networking.hostName = "sxmchn";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
	system.stateVersion = "25.11";
}
