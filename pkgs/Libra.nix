{pkgs ? import <nixpkgs> {}, ...}:
#ERROR: dependencies 'dplyr', 'purrr', 'tibble', 'magrittr', 'tester', 'Matrix', 'pbmcapply', 'lmtest', 'tidyselect', 'DESeq2', 'Seurat', 'blme', 'edgeR', 'glmmTMB', 'limma', 'lme4', 'lmerTest', 'matrixStats', 'forcats'
pkgs.rPackages.buildRPackage {
  name = "Libra";
  src = pkgs.fetchFromGitHub {
    owner = "neurorestore";
    repo = "Libra";
    rev = "0a680543333261dca0aac4cdc6c2c38c442c0ded";
    hash = "sha256-xmr8cXi7CAMF+FNV86NB8rYrcLfNprey8cZL0afBQwU=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = with pkgs.rPackages; [
    dplyr
    purrr
    tibble
    magrittr
    tester
    Matrix
    pbmcapply
    lmtest
    tidyselect
    DESeq2
    Seurat
    blme
    edgeR
    glmmTMB
    limma
    lme4
    lmerTest
    matrixStats
    forcats
    Rdpack
  ];
}
