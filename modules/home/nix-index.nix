{ flake, ... }:
{
  # Используем только новый nix-index-database
  imports = [
    flake.inputs.nix-index-database.homeModules.nix-index
  ];

  # ❌ Полностью отключаем старый nix-index (он тянет GHC)
  programs.nix-index.enable = false;

  # ✔ Включаем новый быстрый command-not-found через comma
  programs.nix-index-database.comma.enable = true;
}

