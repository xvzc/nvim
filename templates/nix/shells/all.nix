{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd
    nixfmt-rfc-style

    # Language Servers & Formatters
    lua-language-server
    shellcheck
    shfmt
    stylua
    tree-sitter

    bash-language-server
    nixd
    nixfmt-rfc-style
    nodejs
    shellcheck
    shfmt
    tree-sitter
    (pkgs.python312.withPackages (
      ppkgs: with ppkgs; [
        pip
        python-lsp-server
        black
        flake8
      ]
    ))
  ];
}
