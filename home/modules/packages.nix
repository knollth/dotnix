{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    # dev
    vimPlugins.nightfox-nvim
    tree-sitter
    vscode
    typst
    qtcreator
    jetbrains.clion
    jetbrains.idea-ultimate

    # Uni
    mathematica
    rclone
    onlyoffice-bin

    # communication
    discord
    zoom-us
    telegram-desktop

    # Audio
    reaper
    reaper-sws-extension
    reaper-reapack-extension

    # wayland stuff
    wofi
    waybar
    swaybg

    # cursor-themes
    vanilla-dmz

    # misc
    powertop
    pfetch
    gnome-tweaks
    yazi
    tldr
   

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

}
