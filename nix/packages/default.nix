{self, ...}: {
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: let
    package = builtins.fromJSON (builtins.readFile ../../package.json);
    nodePackages = config.soopyc.sba-2024.nodePackages;
    src = ../..;
  in {
    packages = rec {
      # https://github.com/NixOS/nixpkgs/blob/61de8ba44d17dfa0cbcb3103fd41157fba2343a0/pkgs/by-name/ve/vesktop/package.nix#L40
      pnpmDeps = pkgs.callPackage ./pnpm-deps.nix {inherit self nodePackages src config package;};
      default = pkgs.callPackage ./service.nix {inherit nodePackages config pnpmDeps src;};
    };
  };
}
