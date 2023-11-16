{
  self',
  src,
  pkgs,
  config,
  stdenvNoCC,
  pnpmStore,
  nodeModules, # our stuff
  nodePackages, # nixpkgs stuff
}: let
  viteConfig = pkgs.substituteAll {
    src = ../vite.config.ts.in;
    nodeModules = self'.packages.nodeModules;
  };
in
  stdenvNoCC.mkDerivation (finalAttrs: {
    pname = config.soopyc.sba-2024.name;
    version = pnpmStore.version;
    src = src;

    buildPhase = ''

    '';
  })
