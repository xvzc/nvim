# save this as shell.nix
{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    stylua
    lua-language-server
  ];

  shellHook = # sh
    ''
      export name="nix:nvim"
    '';
}
