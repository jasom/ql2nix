
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-migrations-20110110-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-migrations/2011-01-10/cl-migrations-20110110-http.tgz";
        sha256 = "b1e71dc665061fde17fd4364485b3cb6ab620cf5224a5a83eacbf40e8ff3cd82";
      };
    }
