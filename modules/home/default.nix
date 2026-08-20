{ lib, ... }:

let
  inherit (builtins) attrNames readDir filter;
in
{
  imports =
    map (fn: ./${fn})
      (filter (fn: fn != "default.nix") (attrNames (readDir ./.)));
}
