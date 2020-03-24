self: super:

let
  newGtk = super.gtk3.overrideAttrs (attrs: {
    patches = attrs.patches ++ [ ./file-chooser__typeahead.patch ];
  });

  setPriority = priority: drv:
    drv.overrideAttrs (_: { meta.priority = priority; });

in {
  my-vim = setPriority (-1) (self.vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = ''
      let g:using_nix_config = 1
      set rtp+=${self.fzf.out}/share/vim-plugins/${self.fzf.out.name}

      ${builtins.readFile ./vimrc}
    '';
    vimrcConfig.packages.all = with self.vimPlugins; {
      start = [
        nerdtree
        fzf-vim
        surround
        vim-indent-object
        ale
        vim-snippets
        vim-signify
        matchit-zip
        vim-colorschemes
        easymotion
        vim-repeat
        commentary
        elm-vim
        vim-nix
        vim-ledger
        Solarized
        ack-vim
      ];
    };
  });

  st = super.st.overrideAttrs (oldAttrs: { src = self.lib.cleanSource ~/st; });

  slstatus = super.slstatus.overrideAttrs (oldAttrs: {
    src = self.lib.cleanSource ~/slstatus;
    buildPhase = ''
      make ${
        if builtins.pathExists /sys/class/power_supply/BAT1 then
          "CFLAGS=-DHAS_TWO_BATTERIES"
        else
          ""
      }
    '';
  });

  dwm = super.dwm.overrideAttrs (oldAttrs: {
    src = self.lib.cleanSource ~/dwm;
    dontPatchELF = true;
    dontStrip = true;
  });

  firefox = setPriority (-2) (self.replaceDependency {
    drv = super.firefox;
    oldDependency = super.gtk3;
    newDependency = newGtk;
  });

  grabc = self.callPackage ../grabc.nix { };
}
