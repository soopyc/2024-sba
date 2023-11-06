{
  src,
  config,
  stdenvNoCC,
  pnpmDeps,
  nodePackages,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = config.soopyc.sba-2024.name;
  version = pnpmDeps.version;
  src = src;

  buildPhase = ''

  '';
})
