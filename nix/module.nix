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
      cfg = config.soopyc.sba-2024;
    in {
      options = {
        soopyc.sba-2024 = {
          enable = lib.mkEnableOption {
            default = false;
            description = lib.mdDoc "Whether to enable this service";
          };

          _node2nix = lib.mkOption {
            description = lib.mdDoc "the node2nix derivation to use";
            type = lib.types.attrs;
          };

          _nodeDeps = lib.mkOption {
            description = lib.mdDoc "the node dependencies derivation to use";
            type = lib.types.package;
          };

          nodeVersion = lib.mkOption {
            description = lib.mdDoc "the node version to use";
            type = lib.types.package;
            default = pkgs.nodejs_18;
          };
        };
      };

      config = lib.mkIf cfg.enable {
        soopyc.sba-2024 = {
          # this is a complete mess
          # https://github.com/svanderburg/node2nix/issues/301
          _nodeDeps = lib.mkDefault (cfg._node2nix.nodeDependencies.override (prev: {
            src = prev.src.overrideAttrs (_: prev': {
              src = builtins.path {
                name = prev'.name + "-src";
                path = cfg._node2nix.args.src;
                filter = f: _: builtins.elem (builtins.baseNameOf f) ["package.json"];
              };
            });
          }));
        };
      };
    });
  };
}
