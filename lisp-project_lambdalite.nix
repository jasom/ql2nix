
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lambdalite-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lambdalite/2014-12-17/lambdalite-20141217-git.tgz";
        sha256 = "1185a5f1ed911739439bdaffbc6a3bcabcde12aa2a2d7a521d06db6b95e689e2";
      };
    }
