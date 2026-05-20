{
  # Home Assistant Container
  virtualisation.oci-containers.backend = "podman";

  virtualisation.oci-containers.containers.homeassistant = {
    image = "ghcr.io/home-assistant/home-assistant:stable";
    autoStart = true;

    volumes = [
      "/var/lib/home-assistant:/config"
      "/etc/localtime:/etc/localtime:ro"
      "/run/dbus:/run/dbus:ro"
    ];

    extraOptions = [
      "--network=host"
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
    ];

    environment = {
      TZ = "Europe/Moscow";
    };
  };

  # Открыть порт HA
  networking.firewall.allowedTCPPorts = [ 8123 ];
}
