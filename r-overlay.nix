final: prev: {
  rPackages = prev.rPackages.override {
    overrides = {
      ggradar = prev.callPackage ./pkgs/ggradar.nix {};
      hdWGCNA = prev.callPackage ./pkgs/hdWGCNA.nix {};
      Libra = prev.callPackage ./pkgs/Libra.nix {};
      loomR = prev.callPackage ./pkgs/loomR.nix {};
      monocle3 = prev.callPackage ./pkgs/monocle3.nix {};
      presto = prev.callPackage ./pkgs/presto.nix {};
      SeuratData = prev.callPackage ./pkgs/SeuratData.nix {};
      SeuratDisk = prev.callPackage ./pkgs/SeuratDisk.nix {};
      seuratwrappers = prev.callPackage ./pkgs/seuratwrappers.nix {};
      azimuth = prev.callPackage ./pkgs/azimuth.nix {};
    };
  };
}
