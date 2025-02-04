{
  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, devenv, systems, ... } @ inputs:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      packages = forEachSystem (system: {
        devenv-up = self.devShells.${system}.default.config.procfileScript;
        devenv-test = self.devShells.${system}.default.config.test;
      });

      devShells = forEachSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = [
              ./wanderer-genshin-grub-theme
            ];
          };
          packages = {
            "wanderer-genshin-grub-theme" = pkgs.stdenv.mkDerivation {
              name = "wanderer-genshin-grub-theme";
              src = ./.;
              buildInputs = [
                pkgs.grub2
              ];
              buildPhase = ''
                # Nothing to do here...
              '';
              installPhase = ''
                mkdir -p $out
                cp -r $src/wanderer-grub-theme $out
              '';
            };
          };
        }
      );
    };
}
