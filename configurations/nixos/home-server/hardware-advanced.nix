{ lib, pkgs, ... }:

{
######################
## Power management ##
######################

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
  
######################
##     Bluetoth     ##
######################

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.enableAllFirmware = true;
  services.dbus.enable = true;

  nixpkgs.config.allowUnfree = true;

######################
##     SLZB-06U     ##
######################
# Для доступа к serial порту добавляем пользователя в группу

  users.users.artme.extraGroups = lib.mkAfter [
    "dialout"
  ];


environment.systemPackages = lib.mkAfter (with pkgs; [
    powertop
    lm_sensors
    linuxKernel.packages.linux_zen.cpupower
    bluez
  ]);


}
