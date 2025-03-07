{
  # Define URLs/references to package sources. See https://nix.dev/manual/nix/2.22/command-ref/new-cli/nix3-flake for more information on references/syntax.
  inputs = {
    stable.url = "github:NixOS/nixpkgs?ref=nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  };

  # Define packages to use as well as the instructions for building the dev shell.
  outputs =
    # List inputs, the ellipsis indicates that anything else passed to this flake at runtime is also usable (not super relevant here, moreso for other types of flakes)
    {
      stable,
      unstable,
      ...
    }: {
      # This is the main command. Everything else below is part of the definition of this dev shell.
      # The contents of the dev shell are enumerated by the "in" phrase at the bottom, and the contents of the "let" phrase define the packages to be invoked within the "in" section.
      # Analagous to math syntax defining a function: give a function name, define the parameters/domains of variables, then write out the function in terms of those parameters/variables.
      devShells.x86_64-linux =
        # Start of the "let" definition section of the dev shell.
        let
          pkgs = stable.legacyPackages.x86_64-linux;
          upkgs = unstable.legacyPackages.x86_64-linux;
          # Packages not contained in CRAN must be built using the below syntax in this section of the flake.
          # Builds an R package from a github repository.
          #  SeuratData = pkgs.rPackages.buildRPackage {
          #    name = "SeuratData";
          #    src = pkgs.fetchFromGitHub {
          #      owner = "satijalab";
          #      repo = "seurat-data";
          #      rev = "4dc08e022f51c324bc7bf785b1b5771d2742701d";
          #      hash = "sha256-dyv8ttrVaGwd5tPle2+wDHMa8lVjozZnVMsKArEMTPE=";
          #    };
          #    propagatedBuildInputs = with pkgs.rPackages; [
          #      Seurat
          #      cli
          #      crayon
          #      rappdirs
          #      SeuratObject
          #    ];
          #  };
          #  DoubletFinder = pkgs.rPackages.buildRPackage {
          #    name = "DoubletFinder";
          #    src = pkgs.fetchFromGitHub {
          #      owner = "chris-mcginnis-ucsf";
          #      repo = "DoubletFinder";
          #      rev = "03e9f37f891ef76a23cc55ea69f940c536ae8f9f";
          #      hash = "sha256-d7U6rryThcgJbfIs6TeBJv7+0LPWMONuwiJsT0ckbjk=";
          #      fetchSubmodules = true;
          #    };
          #    propagatedBuildInputs = with pkgs.rPackages; [
          #      fields
          #      KernSmooth
          #      ROCR
          #    ];
          #  };
          #  Azimuth = pkgs.rPackages.buildRPackage {
          #    name = "Azimuth";
          #    src = pkgs.fetchFromGitHub {
          #      owner = "satijalab";
          #      repo = "azimuth";
          #      rev = "243ee5db80fcbffa3452c944254a325a3da2ef9e";
          #      hash = "sha256-9aexIQuooGJpPqTNx+trhC9hJocRAPSDFJsJN0dARG8=";
          #      fetchSubmodules = true;
          #    };
          #    propagatedBuildInputs = with pkgs.rPackages; [
          #      BSgenome_Hsapiens_UCSC_hg38
          #      DT
          #      EnsDb_Hsapiens_v86
          #      future
          #      ggplot2
          #      glmGamPoi
          #      googlesheets4
          #      hdf5r
          #      htmltools
          #      httr
          #      JASPAR2020
          #      jsonlite
          #      Matrix
          #      patchwork
          #      presto
          #      Rcpp
          #      rlang
          #      scales
          #      Seurat
          #      SeuratObject
          #      shiny
          #      shinyBS
          #      shinydashboard
          #      shinyjs
          #      Signac
          #      stringr
          #      TFBSTools
          #      plotly
          #      withr
          #      SeuratDisk
          #      SeuratData
          #    ];
          #  };
          # Additional R packages to manually define go here.
          # Start of "in" function definition for dev shell. At this point, all packages have been defined.
          # Any additional packages that you wish to be able to use in R Studio must be included in the previous section.
          # Any packages that you want to be available in the dev shell, but not R Studio, can be included below.
          #######      in
          #######        # Additional "let" phrase that allows us to use R Studio with the packages defined above, giving us a graphical environment. A similar protocol can be used with Jupyter.
          #######        # If this is not necessary, then only one set of "let ... in" is needed. In nix, you cannot nest "let ... in" statements, giving rise to the two sets of "let ... in" shown here.
          #######        let
          #######          # To use R Studio with these packages, first run `nix develop` in the terminal, then from the dev shell terminal run `rstudio`. Do not open from the regular system version of R Studio.
          #######          RStudio-with-my-packages = pkgs.rstudioWrapper.override{
          #######            packages = with pkgs.rPackages; [
          #######              Seurat
          #######              seuratwrappers
          #######              SingleCellExperiment
          #######              scater
          #######              loomR
          #######              patchwork
          #######              sctransform
          #######              dplyr
          #######              ggplot2
          #######              ggraph
          #######              igraph
          #######              tidyverse
          #######              data_tree
          #######              HGNChelper
          #######              monocle3
          #######              magrittr
          #######              hdWGCNA
          #######              UCell
          #######              corrplot
          #######              cowplot
          #######              repr
          #######              IRdisplay
          #######              IRkernel
          #######              DESeq2
          #######              gprofiler2
          #######              enrichR
          #######              presto
          #######              DoubletFinder
          #######              clustree
          #######              openxlsx
          #######              glmGamPoi
          #######            #  Azimuth
          #######              SeuratDisk
          #######            #  SeuratData
          #######              devtools
          #######              UpSetR
          #######	scCustomize
          #######	speckle
          #######	ggvenn
          #######	ggVennDiagram
          #######            ];
          #######          };
          #######          # If applicable (see above), additional packages may be added here.
          #######        # This clause defines the packages included in the dev shell. When you run `nix develop`, it will evaluate this list and build those packages.
          #######        # Note that for R packages, you must still load packages with the `library()` command. To make this process easier, use the "easypackages" package to load multiple packages at once.
        in {
          default = pkgs.mkShell {
            # Syntax: packages available in nixpgs repo (i.e. all CRAN packages) are loaded with "pkgs.rPackages.<NAME>" to pull from nixpkgs. Packages defined above are loaded via their name.
            packages = [
              pkgs.R
              pkgs.rPackages.easypackages
              pkgs.rPackages.Seurat
              pkgs.rPackages.SingleCellExperiment
              pkgs.rPackages.scater
              pkgs.rPackages.patchwork
              pkgs.rPackages.sctransform
              pkgs.rPackages.dplyr
              pkgs.rPackages.ggplot2
              pkgs.rPackages.ggraph
              pkgs.rPackages.igraph
              pkgs.rPackages.tidyverse
              pkgs.rPackages.data_tree
              pkgs.rPackages.HGNChelper
              pkgs.rPackages.magrittr
              pkgs.rPackages.UCell
              pkgs.rPackages.corrplot
              pkgs.rPackages.cowplot
              pkgs.rPackages.repr
              pkgs.rPackages.IRdisplay
              pkgs.rPackages.IRkernel
              pkgs.rPackages.DESeq2
              pkgs.rPackages.gprofiler2
              pkgs.rPackages.enrichR
              pkgs.rPackages.clustree
              pkgs.rPackages.openxlsx
              pkgs.rPackages.glmGamPoi
              pkgs.rPackages.devtools
              pkgs.rPackages.UpSetR
              pkgs.rPackages.scCustomize
              pkgs.rPackages.speckle
              pkgs.rPackages.ggvenn
              pkgs.rPackages.ggVennDiagram
              #  RStudio-with-my-packages
              seuratwrappers
              loomR
              monocle3
              hdWGCNA
              presto
              #  DoubletFinder
              #  Azimuth
              SeuratDisk
              #  SeuratData
              Libra
            ];
          };
        };
    };
}
