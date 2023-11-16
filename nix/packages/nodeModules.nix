{
  src,
  config,
  stdenvNoCC,
  pnpmStore,
  nodePackages,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  # FIXME: figure out how to not make this rebuild on every change
  pname = "${config.soopyc.sba-2024.name}-node-modules";
  version = pnpmStore.version;
  src = builtins.path {
    path = src;
    filter = f: _: builtins.elem (builtins.baseNameOf f) ["package.json" "pnpm-lock.yaml"];
  };

  nativeBuildInputs = [
    nodePackages.pnpm
  ];

  dontFixup = true;
  installPhase = ''
    export HOME=$(mktemp -d)

    pnpm config set store-dir ${pnpmStore}
    pnpm config set side-effects-cache false
    pnpm install --offline

    # this should work because the store-dir should still be there?
    cp node_modules $out -rf
  '';
})
