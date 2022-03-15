let
  pkgs = import (builtins.fetchGit { 
    name = "nixpkgs-latex";
    url = https://github.com/nixos/nixpkgs-channels/;
    ref = "refs/heads/nixos-unstable";
    # git ls-remote https://github.com/nixos/nixpkgs-channels nixos-unstable
    rev = "ae6bdcc53584aaf20211ce1814bea97ece08a248";
  }) {};
in

with pkgs;

stdenv.mkDerivation {
  name = "paper";
  src = ./src;

  TEXMFVAR="/tmp/texmf";

  preBuild = ''
    mkdir -p $TEXMFVAR
  '';

  installPhase = ''
    mkdir -p $out
    cp paper.pdf $out
  '';


  buildInputs = [
    pkgs.fontconfig
    (texlive.combine {
      inherit (texlive) scheme-small luatex biblatex latexmk stix2-otf biber unicode-math lualatex-math;
    })
  ];
}
