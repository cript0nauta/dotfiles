let
  pkgs = import <nixpkgs> {};

  newGtk = 
    with pkgs;
    gtk3.overrideAttrs (attrs: {
      patches = attrs.patches ++ [./file-chooser__typeahead.patch];
    });
in
  with pkgs;
  replaceDependency {
    drv = firefox;
    oldDependency = gtk3;
    newDependency = newGtk;
  }
