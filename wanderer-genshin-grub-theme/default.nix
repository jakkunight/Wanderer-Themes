{ pkgs, inputs, ... }: (
  pkgs.stdenv.mkDerivation {
    name = "wanderer-genshin-grub-theme";
    src = ./.;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/
      cp -R $src/icons $src/theme.txt $src/*.png $src/*.jpg $src/*.pf2 $out
    '';
  }
)
