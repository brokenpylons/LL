# PaperTemplate
![Build](https://github.com/brokenpylons/PaperTemplate/workflows/Build/badge.svg)

Template repository for reproducible paper builds.

## Assumptions
- Paper file name: paper.tex
- Latex compiler: ```lualatex```
- Build tool: ```latexmk```
- References file name: references.bib
- References format: ```biblatex```
- References compiler: ```biber```

## Build
For the final build use ```nix-build```.
For development use ```nix-shell``` and just run ```make``` manually.

## GitHub Actions
The repositry has an action setup for building the paper.
It runs ```nix-build``` and uploads the paper as an artifact.
The dependencies are cached between runs to optimize the build times (cca. 2 min).

## Notes
```lualatex``` and ```luaotfload-tool``` fail without output when ran using ```nix-build```.
The problem is that they don't have access to the ```TEXMFVAR``` directory.
You can fix that by setting the variable to something that is accessible (in this template it is set to ```/tmp/texmf```).

To get a complete closure for the derivation (with binary build-time dependencies) you need to run:
```
nix-store -qR --include-outputs <derivation path>
```

## See also
- [inspiration](https://github.com/dnadales/nix-latex-template)
- [nix-store --export/--import](https://nixos.org/nix/manual/#refsec-nix-store-export)
- [cache documentation](https://help.github.com/en/actions/configuring-and-managing-workflows/caching-dependencies-to-speed-up-workflows)
- [github.sha trick](https://github.community/t5/GitHub-Actions/Understanding-Cache-Action-keys/td-p/44842)
- [font problem](https://github.com/NixOS/nixpkgs/issues/24485) (lualatex seems to work fine without fontcache, though)
