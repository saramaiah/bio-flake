{pkgs ? import <nixpkgs> {}, ...}:
pkgs.rPackages.buildRPackage {
  name = "hdWGCNA";
  src = pkgs.fetchFromGitHub {
    owner = "smorabit";
    repo = "hdWGCNA";
    rev = "8280ba5dc375bc44d92a312a5ff7a7b95aee2d85";
    sha256 = "1akq0xzrsdw4wmq0vz09m88ri4dq3aljs8g70mmvqx5nsk3jiam4";
  };
  # List dependencies of package. To determine, first leave blank and then run `nix develop`.
  propagatedBuildInputs = with pkgs.rPackages; [
    WGCNA # It will return an error that lists necessary dependencies.
    igraph # If dependencies are in nixpkgs, list here (whitespace separated, no commas/semicolons)
    Seurat # If dependencies are not in nixpkgs, build them using the buildRPackage() function above the current one, then call here.
    harmony
    tester
    proxy
  ];
}
