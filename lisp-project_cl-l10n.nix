
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-l10n-20161204-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-l10n/2016-12-04/cl-l10n-20161204-darcs.tgz";
        sha256 = "f46fa3ea1f7d87874772614fb98720b4a64969e1afb759183a5f05a1277f12e5";
      };
    }
