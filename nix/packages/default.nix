{self, ...}: {
  perSystem = {
    self',
    config,
    pkgs,
    lib,
    ...
  }: let
    npmPackage = builtins.fromJSON (builtins.readFile ../../package.json);
    nodePackages = config.soopyc.sba-2024.nodePackages; # this is the nixpkgs' nodePackages
    src = ../..;
  in {
    packages = rec {
      # https://github.com/NixOS/nixpkgs/blob/61de8ba44d17dfa0cbcb3103fd41157fba2343a0/pkgs/by-name/ve/vesktop/package.nix#L40
      pnpmStore = pkgs.callPackage ./pnpm-store.nix {inherit self src config nodePackages npmPackage;};
      nodeModules = pkgs.callPackage ./nodeModules.nix {inherit src config nodePackages pnpmStore;};
      default = pkgs.callPackage ./service.nix {inherit src config nodePackages nodeModules pnpmStore self';};
    };
  };
}
