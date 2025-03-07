{
  description = "A flake full of R packages for Bioinformatics";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Make this changable via `follows?`
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
  in {
    packages = forEachPkgs (pkgs: import ./pkgs {inherit pkgs;});
  };
}
