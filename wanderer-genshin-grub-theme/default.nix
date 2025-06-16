{ pkgs, inputs, ... }: (
  pkgs.stdenv.mkDerivation {
    name = "wanderer-genshin-grub-theme";
    src = ./.;
    dontBuild = true;
    installPhase = ''
      runHook preInstall

      mkdir -p $out/
      cp -r $src/* $out

      runHook postInstall
    '';
  }
)
