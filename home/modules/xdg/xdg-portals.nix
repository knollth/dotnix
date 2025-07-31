{pkgs,lib,...}:
{
  xdg.portal = lib.mkForce {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
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
