{
  services.nginx = {
    enable = true;

    # Общие настройки для проксируемых веб-сервисов.
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
