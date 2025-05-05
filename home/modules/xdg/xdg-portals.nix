{pkgs,lib,...}:
{
  xdg.portal = lib.mkForce {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [pkgs.hyprland];
    config = {
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
      };
    };
  };
}
