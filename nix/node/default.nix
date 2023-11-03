{
  perSystem = {
    self',
    pkgs,
    ...
  }: {
    packages = rec {
      node2nix = import ./composition.nix {
        inherit pkgs;
        nodejs = pkgs.nodejs_20;
      };
      # this is a complete mess
      # https://github.com/svanderburg/node2nix/issues/301
      nodeDeps = node2nix.nodeDependencies.override (prev: {
        src = prev.src.overrideAttrs (_: prev': {
          src = builtins.path {
            name = prev'.name + "-src";
            path = node2nix.args.src;
            filter = f: _: builtins.elem (builtins.baseNameOf f) ["package.json"];
          };
        });
      });
    };
  };
}
