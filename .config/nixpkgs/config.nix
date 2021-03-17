let
  lib = import <nixpkgs/lib>;
in
{
  allowUnfree = false;
  allowBroken = false;
  allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "p7zip" "unrar" ];
  virtualisation.memorySize = 2048;
}
