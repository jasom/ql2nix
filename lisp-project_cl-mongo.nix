
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mongo-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mongo/2016-05-31/cl-mongo-20160531-git.tgz";
        sha256 = "4cac0264ff0b20143113c3f389c23f3dc82ad8950c751f978cc0823699906080";
      };
    }
