{
  perSystem = {
    self',
    config,
    pkgs,
    ...
  }: {
    config = {
      soopyc.sba-2024 = {
        _node2nix = import ./composition.nix {
          inherit pkgs;
          nodejs = config.soopyc.sba-2024.nodeVersion;
        };
      };
    };
  };
}
