{pkgs ? import <nixpkgs> {}, ...}:
pkgs.rPackages.buildRPackage {
  name = "presto";
  src = pkgs.fetchFromGitHub {
    owner = "immunogenomics";
    repo = "presto";
    rev = "7636b3d0465c468c35853f82f1717d3a64b3c8f6";
    sha256 = "sha256-Sfjx5e0drUrRA9f0gxmeN8Z3cdz6Q3LBVWM3tV6k8R0=";
    fetchSubmodules = true;
  };
  propagatedBuildInputs = with pkgs.rPackages; [
    Rcpp
    dplyr
    tidyr
    purrr
    tibble
    Matrix
    rlang
    RcppArmadillo
    data_table
  ];
}
