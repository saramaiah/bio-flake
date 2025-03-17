{
  rPackages,
  fetchFromGitHub,
  ...
}:
rPackages.buildRPackage {
  name = "ggradar";
  src = fetchFromGitHub {
    owner = "ricardo-bion";
    repo = "ggradar";
    rev = "f99517ae4df2903d3dbd4116af91b24009a5ac93";
    sha256 = "sha256-0rTb3WDJDgDFTWsB3ilbDCuB4VlHOjRg5Sc/TwTPMWk=";
    fetchSubmodules = true;
  };
  propagatedBuildInputs = with rPackages; [
    forcats
    ggplot2
  ];
}
