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
        ggradar = pkgs.callPackage ./pkgs/ggradar.nix {};
        hdWGCNA = pkgs.callPackage ./pkgs/hdWGCNA.nix {};
        Libra = pkgs.callPackage ./pkgs/Libra.nix {};
        loomR = pkgs.callPackage ./pkgs/loomR.nix {};
        monocle3 = pkgs.callPackage ./pkgs/monocle3.nix {};
        presto = pkgs.callPackage ./pkgs/presto.nix {};
        SeuratData = pkgs.callPackage ./pkgs/SeuratData.nix {};
        SeuratDisk = pkgs.callPackage ./pkgs/SeuratDisk.nix {};
        seuratwrappers = pkgs.callPackage ./pkgs/seuratwrappers.nix {};
      });
  };
}
