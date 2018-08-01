let
  pinned_pkgs =
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/f4607032116308163c2ae95cc7303358370dc85b.tar.gz;
      sha256 = "07p8hih091bmws55n5apv4xwm2k8dmwf99ql2wlmxp16frphpbh9";
    };

  pkgs = import pinned_pkgs {
    config.st.conf = builtins.readFile ./st.config.def.h;
  };

  vimrc = builtins.readFile ./vimrc;
  vim = pkgs.vim_configurable.customize {
    name = null;
    vimrcConfig.customRC = ''
      let g:using_nix_config = 1
      set rtp+=${pkgs.fzf.out}/share/vim-plugins/${pkgs.fzf.out.name}

      ${vimrc}
    '';
    vimrcConfig.packages.all = with pkgs.vimPlugins; {
      start = [
        nerdtree fzf-vim surround vim-indent-object ale vim-snippets
        vim-signify matchit-zip vim-colorschemes easymotion vim-repeat
        commentary elm-vim vim-nix vim-ledger
        ];
    };
  };

  inputs = [vim pkgs.fzf pkgs.st];
in
  if pkgs.lib.inNixShell then
    pkgs.mkShell { buildInputs = inputs; }
  else
    inputs
