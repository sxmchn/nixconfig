{ ... }:

{
  services.mosquitto = {
    enable = true;

    listeners = [
      {
        address = "0.0.0.0";
        port = 1883;

        users = {
          zigbee2mqtt = {
            acl = [ "readwrite #" ];
            password = "hegcos-nikSij-9jynri";
          };

          homeassistant = {
            acl = [ "readwrite #" ];
            password = "nyhpis-juqLuh-9vipfe";
          };
        };
      }
    ];
  };

  services.zigbee2mqtt = {
    enable = true;

    settings = {
      homeassistant = {
        enabled = true;
      };

      frontend = {
        enabled = true;
        port = 8080;
      };

      mqtt = {
        server = "mqtt://127.0.0.1:1883";
        user = "zigbee2mqtt";
        password = "hegcos-nikSij-9jynri";
      };

      serial = {
        port = "/dev/serial/by-id/usb-SMLIGHT_SMLIGHT_SLZB-06U_SLZB-06U198056-if00";
        adapter = "zstack";
        baudrate = 115200;
      };

      permit_join = false;
    };
  };

  systemd.services.zigbee2mqtt.serviceConfig.SupplementaryGroups = [
    "dialout"
  ];

  networking.firewall.allowedTCPPorts = [
    8080
    1883
  ];
}
