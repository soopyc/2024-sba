{
  perSystem = {
    self',
    config,
    pkgs,
    ...
  }: {
    packages = rec {
      node2nix = import ./composition.nix {
        inherit pkgs;
        nodejs = config.soopyc.sba-2024.nodeVersion;
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
