{
  rPackages,
  fetchFromGitHub,
  ...
}:
rPackages.buildRPackage {
  name = "azimuth";
  src = fetchFromGitHub {
    owner = "satijalab";
    repo = "azimuth";
    rev = "51e852319b8ce79135d568308fa95efd4404291b";
    hash = "sha256-4X6hP56zihVxZgH4RFvAFXHUauR0gH/rXNfFN7KSMkA=";
  };

# ERROR: dependencies 'BSgenome.Hsapiens.UCSC.hg38', 'DT', 'EnsDb.Hsapiens.v86', 'future', 'ggplot2', 'glmGamPoi', 'googlesheets4', 'hdf5r', 'htmltools', 'httr', 'JASPAR2020', 'jsonlite', 'Matrix', 'patchwork', 'presto', 'Rcpp', 'rlang', 'scales', 'Seurat', 'SeuratDisk', 'SeuratObject', 'SeuratData', 'shiny', 'shinyBS', 'shinydashboard', 'shinyjs', 'stringr', 'TFBSTools', 'plotly', 'withr' are not available for package 'Azimuth'
  propagatedBuildInputs = with rPackages; [
    BSgenome_Hsapiens_UCSC_hg38
    DT
    EnsDb_Hsapiens_v86
    future
    ggplot2
    glmGamPoi
    googlesheets4
    hdf5r
    htmltools
    httr
    JASPAR2020
    jsonlite
    Matrix
    patchwork
    Rcpp
    rlang
    Seurat
    SeuratObject
    shiny
    shinyBS
    shinydashboard
    shinyjs
    Signac
    stringr
    TFBSTools
    plotly
    withr
    # packages built from source in pkgs/ directory, referenced via overlay in flake.nix
    presto
    SeuratDisk
    SeuratData
  ];
}
