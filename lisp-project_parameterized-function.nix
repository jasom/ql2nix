
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parameterized-function-20140914-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parameterized-function/2014-09-14/parameterized-function-20140914-hg.tgz";
        sha256 = "d371e7b9a1f8535e8fc4df3d73010a26b7bc8651751aed51990f9f233a12d75f";
      };
    }
