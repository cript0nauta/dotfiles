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
        vim-signify
        matchit-zip
        vim-repeat
        commentary
        elm-vim
        vim-nix
        vim-ledger
        Solarized
        ack-vim
        (self.vimUtils.buildVimPlugin {
          pname = "vim-jrnl";
          version = "0.1";
          src = ../../../vim-jrnl;
        })
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

  p7zip = super.p7zip.override {
    enableUnfree = true;
  };

  grabc = self.callPackage ../grabc.nix { };

  grabc-dzen = self.mkScript {
    name = "grabc-dzen";
    version = "0.1";
    env = with self; [ grabc dzen2 ];
    file = self.writeScript "grabc-dzen" ''
      P="$(grabc)"; echo "$P" | dzen2 -p
    '';
  };

  jrnl = self.python3Packages.callPackage ../jrnl.nix { };

  mkScript = self.callPackage ../mk-script.nix { };

  screenshot = self.mkScript {
    name = "screenshot";
    version = "0.2";
    file = ../../../bin/screenshot.sh;
    env = with self; [ bash maim xdotool dmenu xclip ];
  };

  lock = self.mkScript {
    name = "lock";
    version = "0.1";
    file = ../../../bin/lock.sh;
    env = with self; [ i3lock imagemagick scrot ];
  };

  cmt = self.mkScript {
    name = "cmt";
    version = "0.1";
    file = ../../../bin/cmt.py;
    env = with self; [ python3 ];
    interpreter = "python";
  };

  notify = self.mkScript {
    name = "notify";
    version = "0.2";
    file = ../../../bin/notify.sh;
    env = with self; [ dzen2 ];
  };

  zathura-recent = self.mkScript {
    name = "zathura-recent";
    version = "0.1";
    file = ../../../bin/zathura_recent.py;
    env = with self; [ python3 ];
    interpreter = "python";
  };

  pdf = self.mkScript {
    name = "pdf";
    version = "0.1";
    file =  ../../../bin/pdf.sh;
    env = with self; [ dmenu zathura zathura-recent ];
  };

}
