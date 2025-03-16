{
  rPackages,
  fetchFromGitHub,
  ...
}:
rPackages.buildRPackage {
  name = "hdWGCNA";
  src = fetchFromGitHub {
    owner = "smorabit";
    repo = "hdWGCNA";
    rev = "8280ba5dc375bc44d92a312a5ff7a7b95aee2d85";
    sha256 = "1akq0xzrsdw4wmq0vz09m88ri4dq3aljs8g70mmvqx5nsk3jiam4";
  };
  propagatedBuildInputs = with rPackages; [
    WGCNA
    igraph
    Seurat
    harmony
    tester
    proxy
  ];
}
