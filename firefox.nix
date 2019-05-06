{pkgs ? import <nixpkgs> {}, ...}:
let
  newGtk = 
    with pkgs;
    gtk3.overrideAttrs (attrs: {
      patches = attrs.patches ++ [./file-chooser__typeahead.patch];
    });
in
  with pkgs;
  replaceDependency {
    drv = if pkgs.firefox == null then originalFirefox else pkgs.firefox;
    oldDependency = gtk3;
    newDependency = newGtk;
  }
