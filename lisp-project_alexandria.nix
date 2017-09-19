
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_alexandria-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/alexandria/2017-08-30/alexandria-20170830-git.tgz";
        sha256 = "894e54f77594b13137b5b8ec05937ad6b78bc15c4630ffd1e550e1f226a2f96e";
      };
    }
