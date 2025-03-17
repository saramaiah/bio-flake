{
  rPackages,
  fetchFromGitHub,
  ...
}:
rPackages.buildRPackage {
  name = "monocle3";
  src = fetchFromGitHub {
    owner = "cole-trapnell-lab";
    repo = "monocle3";
    rev = "b545460966874948eb11a57a225594a107f1694d";
    hash = "sha256-d18KgC8+XF1TlgA3j2zKU3ud8LJz3A1LmR2E4XGvQCk=";
  };
  propagatedBuildInputs = with rPackages; [
    assertthat
    dplyr
    future
    ggrepel
    grr
    leidenbase
    lmtest
    openssl
    pbapply
    pbmcapply
    pheatmap
    plotly
    plyr
    proxy
    pscl
    purrr
    RANN
    reshape2
    rsample
    RhpcBLASctl
    RcppAnnoy
    Rtsne
    sf
    shiny
    slam
    spdep
    speedglm
    stringr
    uwot
    tidyr
    viridis
    BiocManager
    BiocGenerics
    DelayedArray
    DelayedMatrixStats
    limma
    lme4
    S4Vectors
    SingleCellExperiment
    SummarizedExperiment
    batchelor
    HDF5Array
    terra
    ggrastr
    RcppHNSW
  ];
}
