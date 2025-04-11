{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    discord
    telegram-desktop
    gnome-tweaks
    tree-sitter
    jetbrains.idea-ultimate
    jetbrains.clion
    mathematica
    qtcreator
    yazi
    tldr
    nerd-fonts.hasklug
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    pfetch
    vimPlugins.nightfox-nvim
    zoom-us
    onlyoffice-bin
    rclone
    typst
    powertop

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
