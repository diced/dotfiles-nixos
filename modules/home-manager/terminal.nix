{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    eza
    zoxide
    starship
    fastfetch
    ghostty
  ];

  home.shellAliases = {
    "ls" = "eza";

    "p" = "pnpm";
    "pa" = "pnpm add";
    "pad" = "pnpm add -D";
    "pd" = "pnpm dev";
    "ps" = "pnpm start";
    "pb" = "pnpm build";
  };

  programs = {
    zsh = {
      enable = true;
      history = {
        size = 1000000;
        append = true;
        ignoreAllDups = true;
        extended = true;
        share = true;
      };

      autosuggestion = {
        enable = true;
        strategy = [ "history" "completion" ];
      };

      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
      bindkey "[[3~" delete-char
      bindkey "^H" backward-kill-word
      '';
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = pkgs.lib.importTOML ./starship.toml;
    };

    ghostty = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        font-family = "JetBrainsMono Nerd Font";
        theme = "dark:dark,light:light";
        term = "xterm-256color";
        shell-integration-features = true;
        background-opacity = 0.85;
      };

      themes = {
        dark = {
          palette = [
            "0=#232627"
            "1=#C0392B"
            "2=#8BD49C"
            "3=#FDBC4B"
            "4=#1D99F3"
            "5=#8E44AD"
            "6=#1ABC9C"
            "7=#FCFCFC"
            "8=#7F8C8D"
            "9=#D64030"
            "10=#1CDC9A"
            "11=#FDBC4B"
            "12=#3DAEE9"
            "13=#8E44AD"
            "14=#0DC9B8"
            "15=#FFFFFF"
          ];

          background = "#000000";
          foreground = "#FCFCFC";
          cursor-color = "#FFFFFF";
          cursor-text = "#121212";
          selection-background = "#FFFFFF";
          selection-foreground = "#000000";
        };

        light = {
          palette = [
            "0=#232627"
            "1=#C0392B"
            "2=#8BD49C"
            "3=#FDBC4B"
            "4=#1D99F3"
            "5=#8E44AD"
            "6=#1ABC9C"
            "7=#f7f7f7"
            "8=#7F8C8D"
            "9=#D64030"
            "10=#1CDC9A"
            "11=#FDBC4B"
            "12=#3DAEE9"
            "13=#8E44AD"
            "14=#0DC9B8"
            "15=#FFFFFF"
          ];

          background = "#f7f7f7";
          foreground = "#434343";
          cursor-color = "#434343";
          cursor-text = "#ffffff";
          selection-background = "#BBBBBB";
          selection-foreground = "#434343";
        };
      };
    };
  };
}
