{
  flake-parts-lib,
  withSystem,
  ...
}: let
  inherit (flake-parts-lib) importApply;
  module = importApply ./module.nix {
    inherit withSystem;
  };
in {
  options = {
    flake.flakeModules.default = module;
    perSystem = flake-parts-lib.mkPerSystemOption module;
  };
}
