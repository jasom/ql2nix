
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-case-control-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-case-control/2014-11-06/cl-case-control-20141106-git.tgz";
        sha256 = "999c6186a09df573b3ba8d769f7a788758f989916161a893ba50be6c71f244f1";
      };
    }
