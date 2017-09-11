
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-general-accumulator-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-general-accumulator/2017-02-27/cl-general-accumulator-20170227-git.tgz";
        sha256 = "7c0e02f20d7314a32cae8fe2288f961cb19d4cdc35ad8b235a78b69bf63970ad";
      };
    }
