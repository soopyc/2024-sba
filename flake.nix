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
        ./nix/pre-commit.nix
        ./nix/shell.nix
        ./nix/package.nix
        ./nix/docker.nix
      ];

      perSystem = {pkgs, ...}: {
        formatter = pkgs.alejandra;
      };
    };
}
