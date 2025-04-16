{config, pkgs,lib,...}:
{
  services.wlsunset = {
    enable = true;
    sunset = "19:00";
    sunrise = "8:00";
  };
}
