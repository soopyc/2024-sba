{
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.default = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
      name = "@soopyc/2024-sba";
      src = ./.;

      # https://github.com/NixOS/nixpkgs/blob/61de8ba44d17dfa0cbcb3103fd41157fba2343a0/pkgs/by-name/ve/vesktop/package.nix#L40
      pnpm-deps = pkgs.stdenvNoCC.mkDerivation (finalAtts': {
        inherit (finalAttrs) src;

        name = "${finalAttrs.name}-pnpm-deps";
        outputHash = lib.fakeHash;
        dontFixup = true;
        outputHashMode = "recursive";

        nativeBuildInputs = with pkgs; [
          jq
          moreutils
          nodePackages.pnpm
        ];

        installPhase = ''
          export HOME=$(mktemp -d)
          pnpm config set store-dir $out
          pnpm install --frozen-lockfile --ignore-script

          rm -fr $out/v3/tmp
          for file in $(find $out -name "*.json"); do
            sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
            jq --sort-keys . $f | sponge $f
          done

        '';
      });
    });
  };
}
