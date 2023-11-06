{
  self,
  src,
  pkgs,
  config,
  package,
  nodePackages,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "${config.soopyc.sba-2024.name}-pnpm-deps";
  version = "${package.version}+${self.shortRev or self.dirtyShortRev}";

  src = builtins.path {
    path = src;
    filter = f: _: builtins.elem (builtins.baseNameOf f) ["package.json" "pnpm-lock.yaml"];
  };

  nativeBuildInputs = with pkgs; [
    jq
    moreutils
    nodePackages.pnpm
  ];

  dontFixup = true;
  installPhase = ''
    export HOME=$(mktemp -d)

    pnpm config set store-dir $out
    pnpm install --ignore-script

    rm -rf $out/v3/tmp
    for f in $(find $out -name "*.json"); do
      sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
      jq --sort-keys . $f | sponge $f
    done
  '';

  outputHash = "sha256-fqoc353kQUr4mw0u4mmavTjwh3oo/Swl6oL9tLWxR8A=";
  outputHashMode = "recursive";
})