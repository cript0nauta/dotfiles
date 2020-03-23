self: super:

let
  myPackages = import ./default.nix;
  newGtk = super.gtk3.overrideAttrs (attrs: {
    patches = attrs.patches ++ [ ./file-chooser__typeahead.patch ];
  });

in {
  vim = myPackages.vim;

  st = super.st.overrideAttrs (oldAttrs: { src = self.lib.cleanSource ~/st; });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = self.lib.cleanSource ~/dwm;
    dontPatchELF = true;
    dontStrip = true;
  });

  firefox = (self.replaceDependency {
    drv = super.firefox;
    oldDependency = super.gtk3;
    newDependency = newGtk;
  }).overrideAttrs (_: { meta.priority = -2; });
}
