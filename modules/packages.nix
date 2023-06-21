{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    bat
    curl
    git
    gnupg
    graphviz
    htop
    duf
    hugo
    imagemagick
    jq
    minikube
    mosh
    openssl
    pinentry
    plantuml
    pstree
    pv
    silver-searcher
    tasksh
    taskwarrior
    terraform
    watchexec
    poppler
    tldr
    tmux
    tree
    vault
    yq
    zsh
    iterm2
    nodejs
    yarn
    gftp
    git-lfs
    cloc
    go
    direnv
    ngrok
    wget
    nix-tree
    nix-top
    opusTools
    opusfile
    pkgconfig
    certbot  
    rustup
    ihp-new
    nodePackages.ts-node
    nodePackages.pnpm
    tokei
    trunk
    du-dust
    deno
    poetry
  ];
}