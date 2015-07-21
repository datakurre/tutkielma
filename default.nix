# Usage:
#   $ nix-shell --pure --run make

# With persistent derivation:
#   $ nix-instantiate --indirect --add-root $PWD/shell.drv
#   $ nix-shell $PWD/shell.drv --pure --run make

# With bash alias:
#   function nix() { echo nix-shell --pure --run \"$@\" | sh; }
#   $ nix make [args]

with import <nixpkgs> {}; {
  myEnv = stdenv.mkDerivation {
    name = "myEnv";
    buildInputs = [
      (texLiveAggregationFun { paths = [
        texLive
        texLiveAuctex
        texLiveExtra
        texLivePGF
      ];})
      gnumake
    ];
  };
}
