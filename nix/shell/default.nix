{
  imports = [
    ./pre-commit.nix
  ];

  perSystem = {
    pkgs,
    config,
    ...
  }: let
    nodePackages = config.soopyc.sba-2024.nodePackages;
  in {
    devShells.default = pkgs.mkShell {
      name = config.soopyc.sba-2024.name;

      shellHook = ''
        # setup pre-commit
        ${config.pre-commit.installationScript}

        # setup the standard node_modules dir
        pnpm config --local set store-dir ${config.soopyc.sba-2024.pnpmDeps}
        pnpm install --offline --force
      '';
      packages = with pkgs; [
        alejandra
        config.soopyc.sba-2024.nodeVersion
        nodePackages.pnpm
      ];
    };
  };
}
