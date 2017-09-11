
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fare-quasiquote-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fare-quasiquote/2017-01-24/fare-quasiquote-20170124-git.tgz";
        sha256 = "ccec5c94c58785013e22f19458b3fcae1d24620dcbd2e97ddaec48a39acd9823";
      };
    }
