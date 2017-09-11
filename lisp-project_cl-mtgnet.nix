
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mtgnet-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mtgnet/2016-09-29/cl-mtgnet-20160929-git.tgz";
        sha256 = "cbd2d6ac961d064ca88abd8b5ad0e0ebc5b4d3be8f9cb8bea7d606c5ab07e0a9";
      };
    }
