
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lparallel-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lparallel/2016-08-25/lparallel-20160825-git.tgz";
        sha256 = "213bc89e6bbabe07fc3bcb21be1021b31f6f2ab1b7a2abb358a01ab9bee69c73";
      };
    }
