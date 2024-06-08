# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # hardware.pulseaudio.enable = true;
  # hardware.bluetooth.enable = true; # enables support for Bluetooth
  # hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  # hardware.pulseaudio.configFile = pkgs.writeText "default.pa" ''
  #   load-module module-bluetooth-policy
  #   load-module module-bluetooth-discover
  #   ## module fails to load with 
  #   ##   module-bluez5-device.c: Failed to get device path from module arguments
  #   ##   module.c: Failed to load module "module-bluez5-device" (argument: ""): initialization failed.
  #   # load-module module-bluez5-device
  #   # load-module module-bluez5-discover
  # '';

  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.pulseaudio = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  programs.sway = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.fish.enable = true;
  users.users.alejandro = {   
    shell = pkgs.fish;
  };

  # Configure keymap in X11
  # services.xserver = {
  #   layout = "es";
  #   xkbVariant = "";
  # };

  # Configure console keymap
  console.keyMap = "es";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alejandro = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" "audio" "sound" "video" ];
    packages = with pkgs; [];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    neovim
    alacritty
    kitty
    chromium
    bemenu
    clipcat
    pavucontrol
    openvpn
    nmap
    inetutils
    fish
    git
    python3
    python311Packages.pygments
    zig
    zls
    rustc
    rustup
    cargo
    hyprpaper
    ripgrep
    fd
    unzip
    vscode-langservers-extracted
    prettierd
    lua-language-server
    nodejs
    nodePackages."typescript-language-server"
    nodePackages."live-server"
    deno
    lazygit
    openssl
    bun
    grim
    wl-clipboard
    texliveFull
    swww
    eww
    brightnessctl
    zathura
    ltex-ls
    texlab
    tree
    tree-sitter
    emacs
    # fastfetch
    # kickoff
    tmux
    ispell
    clang
    clang-tools
    # starship
    i3blocks
    smenu
    cmake
    gnumake
    gcc
    # ppsspp-sdl-wayland
    duckstation
    # octaveFull
    # waydroid
    mako
    notify-desktop
    p7zip
    ventoy-full
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    hack-font
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
