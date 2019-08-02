let
  pinned_pkgs =
    fetchTarball {
      url = https://github.com/NixOS/nixpkgs/archive/55757a0d44d11c051648ce03ecfb8881ff4e4dc5.tar.gz;
      sha256 = "1s11570bd90wkhw0msia95mii1snxd2aqxj7pzs6bhdxvsvi2ixf";
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
        commentary elm-vim vim-nix vim-ledger Solarized ack-vim
        ];
    };
  };

  inputs = [vim pkgs.fzf pkgs.st];
in
  if pkgs.lib.inNixShell then
    pkgs.mkShell { buildInputs = inputs; }
  else
    {
      inherit vim;
      inherit (pkgs) fzf;
      all = inputs;
    }
