{
  imports = [
    ./pre-commit.nix
  ];

  perSystem = {
    self',
    pkgs,
    config,
    ...
  }: let
    nodePackages = config.soopyc.sba-2024.nodePackages;
    viteConfig = pkgs.substituteAll {
      src = ../vite.config.ts.in;
      nodeModules = self'.packages.nodeModules;
    };
  in {
    devShells.default = pkgs.mkShell {
      name = config.soopyc.sba-2024.name;

      shellHook = ''
        set -euo pipefail

        # setup pre-commit
        ${config.pre-commit.installationScript}

        # setup the standard node_modules dir
        # link from packages
        rm -f node_modules
        ln -svf ${self'.packages.nodeModules} node_modules

        # configure pnpm
        pnpm config set --local side-effects-cache false
        pnpm config set --local store-dir ${self'.packages.pnpmStore}

        # copy vite config
        cp -f ${viteConfig} ./vite.config.ts
      '';

      packages = with pkgs; [
        alejandra
        just
        config.soopyc.sba-2024.nodeVersion
        nodePackages.pnpm
      ];
    };
  };
}
