{
  description = "A flake extending nixpkgs to include more R packages for Bioinformatics";
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
      rOverlay = import ./r-overlay.nix;
      eachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system; overlays = [rOverlay];}));
    in
      eachSupportedSystem (pkgs: {
        inherit (pkgs.rPackages)
          ggradar
          hdWGCNA
          Libra
          loomR
          monocle3
          presto
          SeuratData
          SeuratDisk
          seuratwrappers
          azimuth
          ;
      });
  };
}
