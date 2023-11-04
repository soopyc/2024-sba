{
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: {
    # packages.default = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
    #   name = "@soopyc/2024-sba";
    #   src = ./.;

    #   buildPhase = ''

    #   '';
    # });
    packages.default = pkgs.stdenvNoCC.mkDerivation {
      pname = "2024-sba";
      version = config.soopyc.sba-2024._node2nix.args.version;

      src = builtins.path {
        path = ../.;
        # filter function to ignore node_modules
        filter = path: type: baseNameOf path != "node_modules";
      };

      nativeBuildInputs = with pkgs; [
        nodePackages.npm
      ];

      buildPhase = ''
        cp -sv ${config.soopyc.sba-2024._nodeDeps}/lib/node_modules ./
        npm run build
      '';
    };
  };
}
