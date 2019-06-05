let
  dotfilesDefault = import ~/dotfiles/default.nix;
in
{
  packageOverrides = pkgs: rec {
    originalFirefox = pkgs.firefox;
    firefox = import ~/dotfiles/firefox.nix {inherit pkgs;};
    inherit (dotfilesDefault) vim fzf st;
  };
}
