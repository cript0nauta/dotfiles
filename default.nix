let
  pinned_pkgs =
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/f5364327e8c6a35fdafe9f3c2f4b8e4e01fccace.tar.gz;
      sha256 = "0p5q72qw5ppa674svpwx7g3gzlk6binyq9mb94xnrsfpmpgzdr10";
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
        nerdtree fzf-vim surround vim-indent-object python-mode ale vim-snippets
        UltiSnips vim-signify matchit-zip vim-colorschemes easymotion vim-repeat
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
