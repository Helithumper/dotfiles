{ config, pkgs, ... }:

let 
  popOsKeybindings = import ./pop-os-keybindings.nix;
in 
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pdd";
  home.homeDirectory = "/home/pdd";
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
      "org/gnome/desktop/applications/terminal" = {
        exec = "${pkgs.kitty}/bin/kitty";
        exec-arg = "-e";
      };
      "org/gnome/desktop/wm/keybindings" = {
        close = ["<Super>c" "<Alt>F4"];
        minimize = ["<Super>comma"];
        toggle-maximized = ["<Super>m"];
        move-to-monitor-left = [];
        move-to-monitor-right = [];
        move-to-monitor-up = [];
        move-to-monitor-down = [];
        move-to-workspace-down = [];
        move-to-workspace-up = [];
        switch-to-workspace-down = ["<Primary><Super>Down"];
        switch-to-workspace-up = ["<Primary><Super>Up"];
        switch-to-workspace-left = ["<Super><Control>Left"];
        switch-to-workspace-right = ["<Super><Control>Right"];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-5 = ["<Super>5"];
        maximize = ["<Super>Up"];
        unmaximize = [];
      };

      "org/gnome/shell/keybindings" = {
        open-application-menu = [];
        toggle-message-tray = ["<Super>v"];
        toggle-overview = [];
      };

      "org/gnome/mutter/keybindings" = {
        toggle-tiled-right = ["<Super>Right"];
        toggle-tiled-left = ["<Super>Left"];
      };

      "org/gnome/mutter/wayland/keybindings" = {
        restore-shortcuts = [];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        screensaver = ["<Super>Escape"];
        home = ["<Super>f"];
        www = ["<Super>b"];
        email = ["<Super>e"];
        rotate-video-lock-static = [];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
      };

      "org/gnome/shell/extensions/hidetopbar" = {
        enable-active-window = false;
        enable-intellihide = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 10;
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "guake toggle";
        command = "guake-toggle";
        binding = "<Super>q";
      };

      "org/gnome/shell/extensions/pop-shell" = {
        toggle-tiling = ["<Super>y"];
        toggle-floating = ["<Super>g"];
        tile-enter = ["<Super>Return"];
        tile-accept = ["Return"];
        tile-reject = ["Escape"];
        toggle-stacking-global = ["<Super>s"];
        pop-workspace-down = ["<Shift><Super>Down" "<Shift><Super>j"];
        pop-workspace-up = ["<Shift><Super>Up" "<Shift><Super>k"];
        pop-monitor-left = ["<Shift><Super>Left" "<Shift><Super>h"];
        pop-monitor-right = ["<Shift><Super>Right" "<Shift><Super>l"];
        pop-monitor-down = [];
        pop-monitor-up = [];
        focus-left = ["<Super>Left" "<Super>h"];
        focus-down = ["<Super>Down" "<Super>j"];
        focus-up = ["<Super>Up" "<Super>k"];
        focus-right = ["<Super>Right"];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          pop-shell.extensionUuid
        ];
      };
    };
  };

  home.packages = [
    # Fonts
    pkgs.material-design-icons
    pkgs.font-awesome
    pkgs.jetbrains-mono
    pkgs.powerline-fonts
    pkgs.powerline-symbols
#(pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" ]; })

    # Desktop Tools
    pkgs.gnomeExtensions.pop-shell
    pkgs.openvpn
    pkgs.burpsuite
    pkgs.pop-launcher
    pkgs.guake
    pkgs.libnotify
    pkgs.waybar
    pkgs.gammastep
    pkgs.hyprpaper
    pkgs.wofi
    pkgs.swaylock
    #pkgs.swayidle
    #pkgs.hypridle

    # Desktop Programs
    pkgs.moonlight-qt
    pkgs.mullvad
    pkgs.discord
    pkgs.signal-desktop
    pkgs.moonlight-qt
    pkgs.mosh
    pkgs.hakuneko
    pkgs.obsidian
    pkgs.mcomix
    pkgs.chromium
    pkgs.firefox
    pkgs.google-chrome
    pkgs.vlc
    pkgs.quodlibet
    pkgs.ncmpcpp
    pkgs.plexamp
    pkgs.spotify
    pkgs.zeal
    pkgs.remmina
#pkgs.element-desktop-wayland
    pkgs.ticktick
    pkgs.prismlauncher
    pkgs.mullvad
    pkgs.openssl
    pkgs.ghidra-bin
    pkgs.vagrant

    # Utilities
    pkgs.nil
    pkgs.awscli
    pkgs.grc
    pkgs.yakuake
    pkgs.yt-dlp
    pkgs.file
    pkgs.killall
    pkgs.whois
    pkgs.tealdeer
    pkgs.dunst
    pkgs.thefuck
    pkgs.htop
    pkgs.ripgrep
    pkgs.ncdu
    pkgs.btop
    pkgs.feh
    pkgs.unzip
    pkgs.pavucontrol
    pkgs.wl-clipboard
    pkgs.eza
    pkgs.bat
    pkgs.tokei

    # Networking tools
    pkgs.mullvad

    # Development Tools
    pkgs.code-cursor
    pkgs.virtualenv
    pkgs.act
    pkgs.pyenv
    pkgs.python313
    pkgs.uv
    pkgs.terraform
    pkgs.ansible
    pkgs.jq
    pkgs.devenv
    pkgs.fzf
    pkgs.lazygit
    pkgs.gnumake
    pkgs.poetry
    pkgs.gh
    pkgs.wasmtime
    pkgs.gcc
    pkgs.rustup
    pkgs.ollama
    pkgs.go
    pkgs.gopls
    pkgs.nodejs
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  services.hypridle.enable = true;

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
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
  #  /etc/profiles/per-user/pdd/etc/profile.d/hm-session-vars.sh
  #
  xdg.mimeApps.defaultApplications = {
    "x-terminal-emulator" = "kitty.desktop";
  };
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };

  programs.kitty = {
    enable = true;
    #themeFile = "Catppuccin-Macchiato";
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/media/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
	name "PipeWire Output"
      }
    '';
  };

  programs.git = {
  	package = pkgs.gitAndTools.gitFull;
	enable = true;
	userName = "Peyton Duncan";
	userEmail = "dev@peytond.me";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza";
      cat = "bat";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "gianu";
    };
  };

  programs.vim = {
    enable = true;
    #extraConfig = builtins.readFile vim/vimrc;
    settings = {
       relativenumber = true;
       number = true;
    };
    plugins = with pkgs.vimPlugins; [
      vim-elixir
      #vim-mix-format
      idris-vim
      sensible
      vim-airline
      The_NERD_tree # file system explorer
      fugitive vim-gitgutter # git 
      rust-vim
      #YouCompleteMe
      vim-abolish
      command-t
      vim-go
    ];
  };

  programs.vscode = {
    enable = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
  };

  # Let Home Manager install and manage itself.
  #programs.home-manager.enable = true;
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    shellAliases = {
      ls = "eza";
    };
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    coc.enable = false;
    withNodeJs = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
	# See https://wiki.hyprland.org/Configuring/Monitors/
        # Laptop Monitor
        monitor=eDP-1,2880x1920@119.97,2880x1920,1.333333,vrr,2
        monitor=DP-3,5120x2880,0x0,1.333333
        #monitor=eDP-1,disable
        # Alienware
        #monitor=DP-4,3840x2160@120,0x0,1,vrr,1
        # LG Dualup
        #monitor=DP-3,2560x2880,3840x-400,1
        #monitor=DP-4,disable
        monitor=,highres,auto,1
        
        
        # unscale xWayland apps
        xwayland {
            force_zero_scaling = true
        }
        
        env = GDK_SCALE,2
        env = XCURSOR_SIZE,32
        
        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        
        # Execute your favorite apps at launch
        # exec-once = waybar & hyprpaper & firefox
        exec-once = waybar & dunst
        exec-once = hyprpaper

        #exec-once = ~/.config/hypr/wallpaper-changer.sh -m eDP-1,DP-4,DP-3 -p ~/wallpapers -i 90
        #exec-once = ~/.config/hypr/wallpaper-changer.sh -m WL-1 -p ~/wallpapers -i 90
        exec-once  = ~/src/github.com/helithumper/dotfiles/.config/hypr/wallpaper-changer.sh -m "eDP-1" -p ~/Pictures/Wallpapers -i 90

        # Gammastep for Seattle
        #exec-once = gammastep -m wayland -g 0.9 -l "47.60:-122.33"
        
        #exec-once = ~/.config/hypr/lid.sh
        
        # Start standard apps
        # Ignoring discord bc it doesn't stay in it's workspace
        #exec-once = [workspace 0 silent] /opt/discord/Discord
        #exec-once = [workspace 9 silent] fractal
        
        # Source a file (multi-file configs)
        # source = ~/.config/hypr/myColors.conf
        
        # Set programs that you use
        $terminal = kitty
        $browser = google-chrome-stable
	      #$browser = firefox
        $fileManager = thunar
        #$menu = wofi --show drun
        $menu = /home/pdd/src/github.com/helithumper/dotfiles/.config/wofi/wofi.sh

        # To fix wofi
        windowrulev2 = stayfocused,class:(wofi)
        windowrulev2 = noborder,class:(wofi)
        
        # Screensaver and lock screen
        $lock = swaylock -f --color 1e1e2eFF
        #exec-once = swayidle -w timeout 300 '$lock' timeout 300 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep '$lock'
        exec-once = hypridle
        
        
        # Some default env vars.
        #env = XCURSOR_SIZE,24
        env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
        
        #bindl=,switch:Lid Switch,exec,swaylock
        bindl=,switch:Lid Switch, exec, ~/.config/hypr/lid.sh
        
        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options =
            kb_rules =
        
            follow_mouse = 1
        
            touchpad {
                natural_scroll = no
            }
        
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }
        
        general {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
        
            gaps_in = 5
            gaps_out = 10
            border_size = 1
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)
        
            layout = dwindle
        
            # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
            allow_tearing = false
        }
        
        #decoration {
        #    # See https://wiki.hyprland.org/Configuring/Variables/ for more
        #
        #    rounding = 10
        #    
        #    blur {
        #        enabled = true
        #        size = 3
        #        passes = 1
        #    }
        #
        #    drop_shadow = yes
        #    shadow_range = 4
        #    shadow_render_power = 3
        #    col.shadow = rgba(1a1a1aee)
        #}
        
        animations {
            enabled = yes
        
            # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        
            bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        
            animation = windows, 1, 7, myBezier
            animation = windowsOut, 1, 7, default, popin 80%
            animation = border, 1, 10, default
            animation = borderangle, 1, 8, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 6, default
        }
        
        dwindle {
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = yes # you probably want this
        }
        
        #master {
        #    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        #    new_is_master = true
        #}
        
        gestures {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            workspace_swipe = true
            workspace_swipe_fingers = 3
        }
        
        misc {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
            vrr = 1
        }
        
        # Example per-device config
        # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
        #device:epic-mouse-v1 {
        #    sensitivity = -0.5
        #}
        
        # Example windowrule v1
        # windowrule = float, ^(kitty)$
        # Example windowrule v2
        # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        #windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
        
        bind =,Print,exec,grim -g "$(slurp -d)" - | wl-copy
        
        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        $mainMod = SUPER
        
        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Q, exec, $terminal
        bind = $mainMod, C, killactive, 
        bind = $mainMod, M, exit,
        bind = $mainMod, E, exec, $fileManager
        bind = $mainMod, B, exec, $browser
        bind = $mainMod, V, togglefloating,
        bind = $mainMod, R, exec, $menu
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
        bind = $mainMod, F, fullscreen
        
        # Special Keys
        bind = , xf86monbrightnessup, exec, brightnessctl set 10%+
        bind = , xf86monbrightnessdown, exec, brightnessctl set 10%-
        
        # Screenlock
        bind = $mainMod, L, exec, $lock
        
        # Volume
        bind = , xf86audioraisevolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
        bind = , xf86audiolowervolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-
        bind = , xf86audiomute, exec, wpctl set-mute @DEFAULT_SINK@ toggle
        
        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d
        
        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10
        
        # Example special workspace (scratchpad)
        bind = $mainMod, S, togglespecialworkspace, magic
        bind = $mainMod SHIFT, S, movetoworkspace, special:magic
        
        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1
        
        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
        
        # Dracula Colors
        # dracula/hyprland
        general {
            col.active_border = rgb(44475a) rgb(bd93f9) 90deg
            col.inactive_border = rgba(44475aaa)
            col.nogroup_border = rgba(282a36dd)
            col.nogroup_border_active = rgb(bd93f9) rgb(44475a) 90deg
            no_border_on_floating = false
            border_size = 2
        
            # non-gradient alternative
            #col.active_border = rgb(bd93f9)
            #col.inactive_border = rgba(44475aaa)
            #col.group_border = rgba(282a36dd)
            #col.group_border_active = rgb(bd93f9)
        
            # darker alternative
            #col.active_border = rgb(44475a) # or rgb(6272a4)
            #col.inactive_border = rgb(282a36)
            #col.group_border = rgb(282a36)
            #col.group_border_active = rgb(44475a) # or rgb(6272a4)
        
        }
        decoration {
            #col.shadow = rgba(1E202966)
        
            # suggested shadow setting
            #drop_shadow = yes
            #shadow_range = 60
            #shadow_offset = 1 2
            #shadow_render_power = 3
            #shadow_scale = 0.97
        }
        
        group {
            groupbar {
                col.active = rgb(bd93f9) rgb(44475a) 90deg
                col.inactive = rgba(282a36dd)
            }
        }
        windowrulev2 = bordercolor rgb(ff5555),xwayland:1 # check if window is xwayland

    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.lf.enable = true;

  programs.zathura.enable = true;

  programs.waybar = {
    enable = true;
    settings = {
      "mainbar" = {
    "layer" = "top";
    "position" = "top";
    "spacing" = 0;
    "height" = 34;
    "modules-left" = [
        #"custom/logo"
        "hyprland/workspaces"
    ];
    "modules-center" = [
        "clock"
    ];
    "modules-right" = [
        "tray"
        "memory"
        "network"
        "pulseaudio"
        "battery"
	"backlight"
        "custom/power"
    ];
    "wlr/taskbar" = {
        "format" = "{icon}";
        "on-click" = "activate";
        "on-click-right" = "fullscreen";
        "icon-theme" = "WhiteSur";
        "icon-size" = 25;
        "tooltip-format" = "{title}";
    };
    "hyprland/workspaces" = {
        "on-click" = "activate";
        "format" = "{icon}";
        "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
        };
        "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
        };
    };
    "memory" = {
        "interval" = 5;
        "format" = "󰍛 {}%";
        "max-length" = 10;
    };
    "tray" = {
        "spacing" = 10;
    };
    "clock" = {
        "tooltip-format" = "<tt>{calendar}</tt>";
        "format-alt" = "  {:%a; %d %b %Y}";
        "format" = "  {:%I:%M %p}";
    };
    "backlight" = {
        "device" = "DP-1";
        "format" = "{icon} {percent}%";
        "format-icons" = ["" "" "" "" "" "" "" "" ""];
        "on-click" = "";
    };
    "network" = {
      "format-wifi" = "{icon} {ipaddr}";
        "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        "format-ethernet" = "󰀂";
	"format-alt" = "󱛇";
        "format-disconnected" = "󰖪";
	"tooltip-format-wifi" = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        "tooltip-format-ethernet" = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
	"tooltip-format-disconnected" = "Disconnected";
	"on-click" = "~/.config/rofi/wifi/wifi.sh &";
        "on-click-right" = "~/.config/rofi/wifi/wifinew.sh &";
	"interval" = 5;
	"nospacing" = 1;
    };
    "pulseaudio" = {
        "format" = "{volume}% {icon}";
        "format-bluetooth" = "󰂰";
        "nospacing" = 1;
        "tooltip-format" = "Volume = {volume}%";
        "format-muted" = "󰝟";
        "format-icons" = {
            "headphone" = "";
            "default" = ["󰖀" "󰕾" ""];
        };
        "on-click" = "pamixer -t";
        "scroll-step" = 1;
    };
    "custom/logo" = {
        "format" = "  ";
        "tooltip" = false;
        "on-click" = "~/.config/rofi/launchers/misc/launcher.sh &";
    };
    "battery" = {
        "format" = "{capacity}% {icon}";
        "format-icons" = {
            "charging" = [
                "󰢜"
                "󰂆"
                "󰂇"
                "󰂈"
                "󰢝"
                "󰂉"
                "󰢞"
                "󰂊"
                "󰂋"
                "󰂅"
            ];
            "default" = [
                "󰁺"
                "󰁻"
                "󰁼"
                "󰁽"
                "󰁾"
                "󰁿"
                "󰂀"
                "󰂁"
                "󰂂"
                "󰁹"
            ];
        };
        "format-full" = "Charged ";
        "interval" = 5;
        "states" = {
            "warning" = 20;
            "critical" = 10;
        };
        "tooltip" = false;
    };
    "custom/power" = {
        "format" = "󰤆";
        "tooltip" = false;
        "on-click" = "~/.config/rofi/powermenu/type-2/powermenu.sh &";
    };
   };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: Material Design Icons, JetBrainsMono Nerd Font;
        font-size: 13px;
      }

      window#waybar {
        /*background-color: #181825;*/
        background-color: transparent;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 6px 18px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button:hover {
       box-shadow: inherit;
       text-shadow: inherit;
       color: #1e1e2e;
       background-color: #cdd6f4;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #memory,
      #custom-power,
      #battery,
      #backlight,
      #pulseaudio,
      #network,
      #clock,
      #tray {
        border-radius: 4px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: #1e1e2e;
        color: #181825;
      }

      #custom-power {
        margin-right: 6px;
      }

      #custom-logo {
        padding-right: 7px;
        padding-left: 7px;
        margin-left: 5px;
        font-size: 15px;
        border-radius: 8px 0px 0px 8px;
        color: #1793d1;
      }

      #memory {
        background-color: #fab387;
      }
      #battery {
        background-color: #f38ba8;
      }
      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: #ff0048;
        color: #181825;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #battery.charging {
        background-color: #a6e3a1;
      }

      #backlight {
        background-color: #fab387;
      }

      #pulseaudio {
        background-color: #f9e2af;
      }

      #network {
        background-color: #94e2d5;
        padding-right: 17px;
      }

      #clock {
        font-family: JetBrainsMono Nerd Font;
        background-color: #cba6f7;
      }

      #custom-power {
        background-color: #f2cdcd;
      }


      tooltip {
      border-radius: 8px;
      padding: 15px;
      background-color: #131822;
      }

      tooltip label {
      padding: 5px;
      background-color: #131822;
      }
    '';
  };

#  programs.waybar = {
#    enable = true;
#    settings = {
#      mainbar = {
#        "height" = 30;
#        "layer" = "top";
#        "margin-top" = 3;
#        "margin-left" = 5;
#        "margin-bottom" = 0;
#        "margin-right" = 5;
#        "spacing" = 5;
#        "modules-left" = ["cpu" "memory" "hyprland/workspaces" "custom/weather"];
#        "modules-center" = ["mpd"];
#        "modules-right" = ["tray" "backlight" "pulseaudio" "network" "battery" "clock" "bluetooth" "custom/power-menu"];
#        "hyprland/workspaces" = {
#          "format" = "{icon}";
#          "on-click" = "activate";
#        };
#        "hyprland/window" = {
#            "format" = "{}";
#        };
#        "tray" = {
#            "spacing" = 10;
#        };
#        "clock" = {
#            "format" = "<span color='#bf616a'> </span>{:%I:%M %p}";
#            "format-alt" = "<span color='#bf616a'> </span>{:%a %b %d}";
#            "tooltip-format" = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
#        };
#
#        "cpu" = {
#          "interval" = 10;
#          "format" = " {usage}%";
#          "max-length" = 10;
#          "on-click" = "";
#        };
#        "memory" = {
#            "interval" = 30;
#            "format" = " {}%";
#            "format-alt" = " {used:0.1f}G";
#            "max-length" = 10;
#        };
#        "backlight" = {
#            "device" = "DP-1";
#            "format" = "{icon} {percent}%";
#            "format-icons" = ["" "" "" "" "" "" "" "" ""];
#            "on-click" = "";
#        };
#        "network" = {
#            "format-wifi" = "直 {signalStrength}%";
#            "format-ethernet" = " wired";
#            "format-disconnected" = "睊";
#            "on-click" = "bash ~/.config/waybar/scripts/rofi-wifi-menu.sh";
#            #"format-disconnected" = "Disconnected  ";
#        };
#
#        "pulseaudio" = {
#            "format" = "{icon} {volume}%";
#            "format-bluetooth" = "  {volume}%";
#            "format-bluetooth-muted" = " ";
#            "format-muted" = "婢";
#            "format-icons" = {
#                "headphone" = "";
#                "hands-free" = "";
#                "headset" = "";
#                "phone" = "";
#                "portable" = "";
#                "car" = "";
#                "default" = ["" "" ""];
#            };
#            "on-click" = "pavucontrol";
#        };
#
#        "bluetooth" = {
#            "on-click" = "~/.config/waybar/scripts/rofi-bluetooth &";
#            "format" = " {status}";
#        };
#
#        "battery" = {
#          "bat" = "BAT1";
#          "adapter" = "ADP0";
#          "interval" = 60;
#          "states" = {
#              "warning" = 30;
#              "critical" = 15;
#          };
#          "max-length" = 20;
#          "format" = "BAT1 {capacity}%";
#          #"format" = "{icon} {capacity}%";
#          "format-warning" = "{icon} {capacity}%";
#          "format-critical" = "{icon} {capacity}%";
#          "format-charging" = "<span font-family='Font Awesome 6 Free'></span> {capacity}%";
#          "format-plugged" = "  {capacity}%";
#          "format-alt" = "{icon} {time}";
#          "format-full" = "  {capacity}%";
#          #"format-icons" = [" " " " " " " " " "];
#        };
#        "custom/weather" = {
#          "exec" = "python3 ~/.config/waybar/scripts/weather.py";
#          "restart-interval" = 300;
#          "return-type" = "json";
#          "on-click" = ""; #TODO: Add back in a link
#        };
#      "custom/quodlibet" = {
#        "exec" = "bash ~/.config/waybar/scripts/quodlibet.sh";
#        "format" = "{}  ";
#        "return-type" = "html";
#        "on-click" = "playerctl play-pause";
#        "on-double-click-right" = "playerctl next";
#        "on-scroll-down" = "playerctl previous";
#        };
#        "custom/power-menu" = {
#            "format" = " <span color='#6a92d7'>⏻ </span>";
#            "on-click" = "bash ~/.config/waybar/scripts/power-menu/powermenu.sh";
#        };
#        "custom/launcher" = {
#            "format" = " <span color='#6a92d7'> </span>";
#            "on-click" = "rofi -show drun";
#        };
#        "mpd" = {
#          "format" = "{stateIcon} {artist} - {title}";
#          "server" = "/home/pdd/.mpd/socket";
#          "format-disconnected" = "🎶";
#          "format-stopped" = "♪";
#          "consume-icons" = {
#            "on" = " ";
#          };
#          "random-icons" = {
#            "off" = "<span color=\"#f53c3c\"></span> ";
#            "on" = " ";
#          };
#          "repeat-icons" = {
#            "on" = " ";
#          };
#          "single-icons" = {
#            "on" = "1 ";
#          };
#          "state-icons" = {
#            "paused" = "";
#            "playing" = "";
#          };
#          "tooltip-format" = "MPD (connected)";
#          "tooltip-format-disconnected" = "MPD (disconnected)";
#          "max-length" = 45;
#        };
#      };
#    };
#  };
#

}
