{pkgs ? import <nixpkgs> {}}: let
  environments = {
    Libra = pkgs.callPackage ./Libra.nix {};
    SeuratData = pkgs.callPackage ./SeuratData.nix {};
    ggradar = pkgs.callPackage ./ggradar.nix {};
    hdWGCNA = pkgs.callPackage ./hdWGCNA.nix {};
    loomR = pkgs.callPackage ./loomR.nix {};
    monocle3 = pkgs.callPackage ./monocle3.nix {};
    presto = pkgs.callPackage ./presto.nix {};
    seurat-wrappers = pkgs.callPackage ./seurat-wrappers.nix {};
  };
  all = packages:
    pkgs.symlinkJoin {
      name = "all";
      paths = builtins.attrValues packages;
    };
in
  environments // {default = all environments;}
