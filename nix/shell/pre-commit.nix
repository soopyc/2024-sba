{
  perSystem = {config, ...}: {
    pre-commit.settings = {
      hooks = {
        prettier.enable = true;
        alejandra = {
          enable = true;
        };
      };

      # settings.prettier.binPath = ./node_modules/.bin/prettier
      settings.alejandra = {
        check = true;
        verbosity = "quiet";
      };
    };
  };
}
