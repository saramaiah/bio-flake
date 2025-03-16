{
  description = "A flake full of R packages for Bioinformatics";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: {
    packages = let
      supportedSystems = [
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      eachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
    in
      eachSupportedSystem (pkgs: {
        hdWGCNA = pkgs.callPackage ./pkgs/hdWGCNA.nix {};
      });
  };
}
