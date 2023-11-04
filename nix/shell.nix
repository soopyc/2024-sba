{
  perSystem = {
    pkgs,
    config,
    lib,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      shellHook = ''
        rm -vf ./node_modules
        ln -sf ${config.soopyc.sba-2024._nodeDeps}/lib/node_modules ./node_modules
        ${config.pre-commit.installationScript}
      '';
      packages = with pkgs; [
        (writeShellScriptBin "node2nix-update" ''
          set -e -u
          root=$(${lib.getExe git} rev-parse --show-toplevel)
          node2nix_root=$root/nix/node
          ${lib.getExe' node2nix "node2nix"} -18 --development \
            --node-env $node2nix_root/node-env.nix \
            --composition $node2nix_root/composition.nix \
            --output $node2nix_root/node-packages.nix \
        '')
        node2nix
        config.soopyc.sba-2024.nodeVersion
      ];
    };
  };
}
