{ ... }:

{
  imports = [
    ./terminal.nix
    ./hyprland
  ];

  home.username = "diced";
  home.homeDirectory = "/home/diced";

  programs.git = {
    enable = true;
    userName = "diced";
    userEmail = "git@diced.sh";
    signing = {
      key = "436B2B0FA0DCA354";
      signByDefault = true;
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}