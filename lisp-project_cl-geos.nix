
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-geos-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-geos/2016-04-21/cl-geos-20160421-git.tgz";
        sha256 = "43f9d0a5bb7bf3037f13375428228c5d5b9e5d813bc1b4735c61081dccba855b";
      };
    }
