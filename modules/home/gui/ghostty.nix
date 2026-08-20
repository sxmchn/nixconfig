{
  pkgs,
  ...
}:
###########################################################
#
# Ghostty Configuration
#
###########################################################
{
  programs.ghostty = {
    enable = true;

    package =
      if pkgs.stdenv.isDarwin then
        null
      else
        pkgs.ghostty;

    enableZshIntegration = true;

    # На Linux можно автоматом подключать bat syntax из Nix-пакета.
    # На macOS нельзя, потому что Ghostty.app лежит вне Nix store.
    installBatSyntax = pkgs.stdenv.isLinux;

    settings = {
      theme = "Gruvbox Dark";
      macos-option-as-alt = true;
      copy-on-select = false;
      confirm-close-surface = false;
    };
  };
}
