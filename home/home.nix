{ config, pkgs, inputs, lib,  ... }:

{
  imports = 
    [
      ./modules
    ];

  home.username = "tom";

  home.homeDirectory = "/home/tom";

  home.sessionVariables = {
    EDITOR="nvim";
    UNI="$HOME/Documents/Studium";
    GDK_SCALE=2;
    GTK_USE_PORTAL=1;
    NIXOS_OZONE_WL = "1";
    ELECTRON_USE_XDG_PORTAL=1;
    _JAVA_OPTIONS = "-Dawt.toolkit.name=WLToolkit";
  };

  home.shellAliases = {
      uni-push = "rclone sync -v $HOME/Documents/Studium drive:/Studium";
      uni-pull = "rclone sync -v drive:/Studium $HOME/Documents/Studium";
      idead = "idea-ultimate . > /dev/null 2>&1 & disown";
      zath= "zathura --fork";
  };

  home.pointerCursor = {
    enable = true;
    name = "Vanilla-DMZ";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.vanilla-dmz;
    hyprcursor = {
      enable = true;
      size = 32;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.file = {
    #".config/waybar".source = ./dotnix/home/modules/waybar;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tom/etc/profile.d/hm-session-vars.sh
  #
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
