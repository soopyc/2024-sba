{
  flake-parts-lib,
  lib,
  ...
}: {
  options = {
    # no docs??
    perSystem = flake-parts-lib.mkPerSystemOption ({
      config,
      pkgs,
      ...
    }: let
      # cfg = config.soopyc.sba-2024;
    in {
      options = {
        soopyc.sba-2024 = {
          enable = lib.mkEnableOption {
            description = lib.mdDoc "Whether to enable this service";
          };

          nodeVersion = lib.mkOption {
            description = lib.mdDoc "the node version to use";
            type = lib.types.package;
            default = pkgs.nodejs_18;
          };
        };
      };
    });
  };
}
