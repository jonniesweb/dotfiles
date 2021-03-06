{ config, pkgs, ... }:
let
  LS_COLORS = pkgs.fetchgit {
    url = "https://github.com/trapd00r/LS_COLORS";
    rev = "6fb72eecdcb533637f5a04ac635aa666b736cf50";
    sha256 = "0czqgizxq7ckmqw9xbjik7i1dfwgc1ci8fvp1fsddb35qrqi857a";
  };
  ls-colors = pkgs.runCommand "ls-colors" { } ''
    mkdir -p $out/bin $out/share
    ln -s ${pkgs.coreutils}/bin/ls $out/bin/ls

    ${pkgs.coreutils}/bin/dircolors -b ${LS_COLORS}/LS_COLORS > $out/share/DIR_COLORS
  '';
  localPackages = [ ls-colors ];
  packages = with pkgs; [
    # system
    entr
    fd
    pstree
    ripgrep
    tree

    # code
    git
    git-revise
    gitAndTools.hub
    jq
    nixpkgs-fmt
    terraform
    docker
  ];
  homeManagerConfigFile = "~/src/github.com/jonniesweb/dotfiles/home-manager/home.nix";
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # programs.home-manager.path = homeManagerConfigFile;
  # home.file."~/.config/nixpkgs/home.nix".source = homeManagerConfigFile;

  home.packages = localPackages ++ packages;
  home.file.".iterm2_shell_integration.zsh".source = ./home/.iterm2_shell_integration.zsh;
  home.file."Library/Preferences/com.googlecode.iterm2.plist".source = ./home/com.googlecode.iterm2.plist;
  home.file.".gitignore_global".source = ./home/.gitignore_global;
  xdg.enable = true;

  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.htop = {
    enable = true;
    meters.left = [ "AllCPUs2" "Memory" "Swap" ];
    meters.right = [ "Tasks" "LoadAverage" "Uptime" ];
    highlightBaseName = true;
    headerMargin = false;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    defaultKeymap = "emacs";
    history.extended = true;

    initExtraBeforeCompInit = builtins.readFile ./home/pre-compinit.zsh;
    initExtra = ''
      ${builtins.readFile ./home/post-compinit.zsh}
      ${builtins.readFile ./home/shell-aliases.zsh}
    '';

    sessionVariables = rec {
      NVIM_TUI_ENABLE_TRUE_COLOR = "1";

      ZSH_THEME = "agnoster";
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=9";
      DEV_ALLOW_ITERM2_INTEGRATION = "1";

      EDITOR = "vim";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;

      GOPATH = "$HOME";
      PATH = "$HOME/bin:$PATH";

      DISABLE_SPRING = "1";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.3";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
      {
        name = "agnoster-zsh-theme";
        src = pkgs.fetchFromGitHub {
          owner = "agnoster";
          repo = "agnoster-zsh-theme";
          rev = "6bba672c7812a76defc3efed9b6369eeee2425dc";
          sha256 = "1p6kx63s050nyhr7y49fjqy7d54zcdrgp0jy2ykhpmps490w1afz";
        };
      }
    ];

  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./home/extraConfig.vim;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      fzf-vim
      lightline-vim
      nerdtree
      supertab
      gruvbox

      vim-polyglot
      vim-commentary
      vim-endwise
      vim-fugitive
      vim-gitgutter
      # git-messenger-vim
      vim-multiple-cursors
      vim-nix
      vim-rhubarb
      vim-surround
      vim-test
      vim-sneak
      vim-indent-object
    ];
  };
}
