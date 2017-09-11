
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ctrnn_1.0.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ctrnn/2010-10-06/cl-ctrnn_1.0.0.tgz";
        sha256 = "faf5764999c34ba89733a421b7a1852d7227c042504124e021e4a6695a34f463";
      };
    }
