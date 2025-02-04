{
  description = "A very basic flake to setup my Wanderer (Genshin Impact) themes.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system} = {
      grub-theme = import ./wanderer-genshin-grub-theme { inherit pkgs; };
    };
  };
}
