{
  rPackages,
  fetchFromGitHub,
  ...
}:

rPackages.buildRPackage {
  name = "SeuratData";
  src = fetchFromGitHub {
    owner = "satijalab";
    repo = "seurat-data";
    rev = "3e51f44303069b64f5dc4d68e6a3d4a343f55c39";
    hash = "sha256-rojO/DpFMHgxK63s8L+uiy9wq1P483fsTXw0LOkNYyQ=";
  };
  propagatedBuildInputs = with rPackages; [
    cli
    crayon
    Matrix
    rappdirs
    SeuratObject
    Seurat
  ];

  preInstall = ''
    export HOME=$TMPDIR
  '';
}
