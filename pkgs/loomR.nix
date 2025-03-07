{pkgs ? import <nixpkgs> {}, ...}:
pkgs.rPackages.buildRPackage {
  name = "loomR";
  src = pkgs.fetchFromGitHub {
    owner = "mojaveazure";
    repo = "loomR";
    rev = "df0144bd2bbceca6fadef9edc1bbc5ca672d4739";
    sha256 = "1b1g4dlmfdyhn56bz1mkh9ymirri43wiz7rjhs7py3y7bdw1s3yr";
  };
  propagatedBuildInputs = with pkgs.rPackages; [
    R6
    hdf5r
    iterators
    itertools
    Matrix
  ];
}
