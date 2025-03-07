{pkgs ? import <nixpkgs> {}, ...}:
pkgs.rPackages.buildRPackage {
  name = "SeuratWrappers";
  src = pkgs.fetchFromGitHub {
    owner = "satijalab";
    repo = "seurat-wrappers";
    rev = "8d46d6c47c089e193fe5c02a8c23970715918aa9";
    sha256 = "1ldb0m714jg4c6nkvvz1rcmzykcm175jhf1i72i0v4y1vrc77md3";
  };
  propagatedBuildInputs = with pkgs.rPackages; [
    BiocManager
    cowplot
    ggplot2
    igraph
    Matrix
    remotes
    rsvd
    Seurat
    rlang
    R_utils
  ];
}
