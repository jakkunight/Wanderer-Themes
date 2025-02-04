{
  description = "A very basic flake to setup my Wanderer (Genshin Impact) themes.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system} = {
      grub-theme = pkgs.stdenv.mkDerivation {
        name = "";
        src = ./wanderer-genshin-grub-theme;
        installPhase = ''
          mkdir -p $out
          cp -r $src $out
        '';
      };
    };
  };
}
