{ pkgs, lib, ... }:

{
  programs.bat.enable = true;

  home.activation.linkGhosttyBatSyntax = lib.mkIf pkgs.stdenv.isDarwin (
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ -f "/Applications/Ghostty.app/Contents/Resources/bat/syntaxes/ghostty.sublime-syntax" ]; then
        mkdir -p "$HOME/.config/bat/syntaxes"
        ln -sfn \
          "/Applications/Ghostty.app/Contents/Resources/bat/syntaxes/ghostty.sublime-syntax" \
          "$HOME/.config/bat/syntaxes/ghostty.sublime-syntax"
      fi
    ''
  );
}
