{ pkgs, inputs, ... }: (
  pkgs.stdenv.mkDerivation {
    name = "wanderer-genshin-grub-theme";
    src = ./.;
    installPhase = ''
      mkdir -p $out
      cp -R $src/ $out
    '';
  }
)
