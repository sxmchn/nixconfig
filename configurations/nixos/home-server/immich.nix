{
  fileSystems."/var/lib/immich" = {
    device = "/dev/disk/by-uuid/a3bba42d-119d-4a8d-8486-36ae9467fe00";
    fsType = "xfs";
    options = [ "noatime" "nodev" "nosuid" "nofail" ];
  };

  services.immich = {
    enable = true;
    host = "127.0.0.1";
    port = 2283;
    mediaLocation = "/var/lib/immich";
  };

  # Do not write media to the SSD if the HDD is unavailable.
  systemd.services.immich-server = {
    requires = [ "var-lib-immich.mount" ];
    after = [ "var-lib-immich.mount" ];
    bindsTo = [ "var-lib-immich.mount" ];
    unitConfig.ConditionPathIsMountPoint = "/var/lib/immich";
  };
}
