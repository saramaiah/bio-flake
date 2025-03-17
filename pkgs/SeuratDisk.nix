{
  rPackages,
  fetchFromGitHub,
  ...
}:
rPackages.buildRPackage {
  name = "SeuratDisk";
  src = fetchFromGitHub {
    owner = "mojaveazure";
    repo = "seurat-disk";
    rev = "877d4e18ab38c686f5db54f8cd290274ccdbe295";
    hash = "sha256-tQXes2KRHFpH8mSY4DCdqBHzcMx0okt1SbN6XdLESVU=";
  };
  propagatedBuildInputs = with rPackages; [
    cli 
    crayon 
    hdf5r 
    Matrix 
    R6 
    rlang 
    Seurat 
    SeuratObject 
    stringi 
    withr
  ];
}
