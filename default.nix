let
  pkgs = import <nixpkgs> {
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
        commentary elm-vim vim-nix
        ];
    };
  };

  inputs = [vim pkgs.fzf pkgs.st];
in
  if pkgs.lib.inNixShell then
    pkgs.mkShell { buildInputs = inputs; }
  else
    inputs
