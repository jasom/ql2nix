
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defsystem-compatibility-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defsystem-compatibility/2010-10-06/defsystem-compatibility-20101006-darcs.tgz";
        sha256 = "f17a4da4335b461a48e414650e5f1961d4ffd0692de6ebb34071dab6d9b7c978";
      };
    }
