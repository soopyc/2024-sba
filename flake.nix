{
  description = "Proof-of-concept website for the 2024 HKDSE ICT SBA";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];
      imports = [
        inputs.pre-commit-hooks.flakeModule
        ./nix/node
        ./nix/module.nix
        ./nix/pre-commit.nix
        ./nix/shell.nix
        ./nix/package.nix
        ./nix/docker.nix
        ./nix/formatter.nix
      ];

      perSystem = {
        pkgs,
        options,
        ...
      }: {
        soopyc.sba-2024.nodeVersion = pkgs.nodejs_20;
        soopyc.sba-2024.enable = true;
      };
    };
}
