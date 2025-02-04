{ pkgs, inputs, ... }:
{
  packages = [
    pkgs.git
    pkgs.grub2
  ];
}
