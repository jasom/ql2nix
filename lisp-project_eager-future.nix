
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eager-future-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eager-future/2010-10-06/eager-future-20101006-darcs.tgz";
        sha256 = "14d70a6fe2a3e830ad4669f6624f85653c50969bf0ecac2f9e3a955264e2727d";
      };
    }
