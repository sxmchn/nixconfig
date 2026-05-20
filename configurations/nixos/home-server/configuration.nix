{ lib, ... }:

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

  users.users.artme.extraGroups = lib.mkAfter [
    "dialout"
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
	system.stateVersion = "25.11";

  # Intel CPU microcode
  hardware.cpu.intel.updateMicrocode = true;

  # Базовое управление питанием
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "powersave";

  # Автонастройка энергосбережения
  powerManagement.powertop.enable = true;

  # Температурный контроль Intel
  services.thermald.enable = true;

  # Нормальный sleep/suspend
  services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
    HandleLidSwitch = "ignore";
  };

  # Для сервера обычно лучше не засыпать автоматически
  systemd.sleep.settings.Sleep = {
    AllowSuspend = "no";
    AllowHibernation = "no";
    AllowHybridSleep = "no";
    AllowSuspendThenHibernate = "no";
  };

}
