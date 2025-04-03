{config,pkgs,lib,...}:
{
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    discord
    telegram-desktop
    ghostty
    gnome-tweaks
    clang
    tree-sitter
    go
    ocaml
    opam
    nixd
    rustc
    cargo
    jetbrains.idea-ultimate
    yazi
    tldr
    nerd-fonts.hasklug
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    oh-my-posh
    fastfetch
    pfetch
    vimPlugins.nightfox-nvim
    

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
