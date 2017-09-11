
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_periodic-table-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/periodic-table/2011-10-01/periodic-table-1.0.tgz";
        sha256 = "6fcb02f511f945eb60fbad76d328085db19c6258f9f6d5335175243c2ade2cc7";
      };
    }
