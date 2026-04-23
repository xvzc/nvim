{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd
    nixfmt-rfc-style
    stylua
    lua-language-server
    tinymist
  ];

  shellHook = # sh
    ''
      export name="nix:nvim"
      export NVIM_APPNAME="nvim"
    '';
}
