{withSystem, ...}: {
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) types;
  cfg = config.soopyc.sba-2024;
in {
  options = {
    soopyc.sba-2024 = withSystem pkgs.system ({self', ...}: {
      enable = lib.mkEnableOption "soopyc.sba-2024";

      name = lib.mkOption {
        description = "*read only* the name of the package, for internal use.";
        default = "soopyc-2024-sba";
        type = types.str;
        readOnly = true;
      };

      package = lib.mkPackageOption self' cfg.name {
        default = "default";
      };

      # package = lib.mkOption {
      #   description = "the actual code package to use";
      #   type = types.package;
      #   default = self'.packages.default;
      # };

      nodeVersion = lib.mkOption {
        description = "the node version to use";
        type = types.package;
        default = pkgs.nodejs_20;
      };

      nodePackages = lib.mkOption {
        description = "";
        default = pkgs.nodePackages.override {nodejs = cfg.nodeVersion;};
        example = "pkgs.nodePackages.override {nodejs = pkgs.nodejs_18;}";
      };

      pnpmDeps = lib.mkOption {
        description = "the pnpm package to use";
        type = types.package;
        default = self'.packages.pnpmDeps;
      };
    });
  };
}
