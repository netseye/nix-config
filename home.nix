{ config, pkgs, ... }:
{
  # Nixpkgs is the channel that provides the packages.
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowAliases = true;
  # Nixpkgs is updated every 6 hours by the Hydra CI system.
  news.display = "silent";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Enable the Nixpkgs release check.
  home.enableNixpkgsReleaseCheck = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jeakin";
  home.homeDirectory = "/Users/jeakin";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.sessionPath = [
      "$HOME/.cargo/bin"  # cargo
      "$HOME/.pnpm-store"  # pnpm
  ];
  home.sessionVariables = {
    EDITOR = "vim";
    SSH_KEY_PATH = "~/.ssh/rsa_id";
    GOPROXY=https://mirrors.aliyun.com/goproxy/;
    GOPRIVATE="jihulab.com/elihr/*,jihulab.com/erli1/*";
    CACHIX_AUTH_TOKEN="eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI3NDZkZjA0OC0zYTExLTQyMDktYTRmZi03NTY3YzA4YjI0MWYiLCJzY29wZXMiOiJ0eCJ9.scKAhzyWJNCpvqKiYQ4QB_Q8t-SQhESuD-KXvnfhOto";
    PKG_CONFIG_PATH="/usr/local/lib/pkgconfig/";
    CC="clang";
    CXX="clang++";
    PNPM_HOME="$HOME/.pnpm-store";
  };

  home.sessionVariablesExtra = '' '';

  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    initExtra = ''
      function setproxy() {
        export {http,https,ftp}_proxy=http://127.0.0.1:7890
        export {HTTP,HTTPS,FTP}_PROXY=http://127.0.0.1:7890
        export all_proxy=socks5://127.0.0.1:7890
      }

      function unsetproxy() {
        unset {http,https,ftp}_proxy
        unset {HTTP,HTTPS,FTP}_PROXY
        unset all_proxy
      }

      [ -f "/Users/jeakin/.ghcup/env" ] && source "/Users/jeakin/.ghcup/env" # ghcup-env
    '';

    envExtra = '' '';
    shellAliases = {
      weather="curl \"wttr.in/Beijing?lang=zh\"";
      sshdev="ssh chenchongyang@47.94.13.0";
      sshstage="ssh jeakin@39.105.25.169";
      ip="curl -s https://api.myip.la/cn\\?json | jq";
      dsn="pmset displaysleepnow";
      python="python3.10";
      pip="pip3.10";
    };
    oh-my-zsh =  {
      enable = true; 
      theme = "dogenpunk";
      plugins = [ "git" "cp" "ssh-agent" ]; 
    };
  };
}
