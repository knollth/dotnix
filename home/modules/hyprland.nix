{config, pkgs,lib,...}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      "$menu" = "wofi --show drun";
      "$term" = "ghostty";
      #"$wallpaper" = "~/Pictures/backgrounds/green/stare.jpg";
      "$wallpaper" = "~/Pictures/backgrounds/nautical/wave.png";

      exec-once = [
        "waybar"
        "swaybg -i $wallpaper"
      ];

      env = [
        "GDK_SCALE,2"
        "_JAVA_OPTIONS,-Dawt.toolkit.name=WLToolkit" # wayland for jetbrains
      ];

      # display
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
      };

      decoration = {
        blur.enabled = false;
        shadow.enabled = false;
      };
      animations.enabled = false;
      monitor=[",highres,auto,2"];
      xwayland.force_zero_scaling = true;

      misc = {
        vrr = 2;
        vfr = true;
      };

      # ---- input and binds ---

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 250;
        #workspace_swipe_direction_lock_threshold = 4;  
        #workspace_swipe_cancel_ratio = 0.3;    
      };


      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        touchpad = {
          natural_scroll = true;
        };
      };
      
      bind = [
        "$mod, RETURN, exec, ghostty"
        "$mod , P, exec, $menu"
        "$mod, M, exit"
        "$mod SHIFT, Q, killactive"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod, V, togglefloating"
        "$mod, SPACE, fullscreen"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];
    };
  };
}
