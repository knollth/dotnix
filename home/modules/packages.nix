{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    # dev
    vimPlugins.nightfox-nvim
    tree-sitter
    vscode
    typst
    jetbrains.clion
    jetbrains.idea-ultimate

    # Uni
    rclone
    onlyoffice-bin
    anki-bin

    # communication
    discord
    zoom-us
    telegram-desktop

    # wayland stuff
    waybar
    swaybg
    grim
    slurp
    
    # cursor-themes
    vanilla-dmz

    # misc
    nautilus
    powertop
    pfetch
    gnome-tweaks
    tldr
    networkmanagerapplet
    vulkan-tools
    winetricks
    
   

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
