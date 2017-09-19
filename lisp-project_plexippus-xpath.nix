
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plexippus-xpath-20120909-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plexippus-xpath/2012-09-09/plexippus-xpath-20120909-darcs.tgz";
        sha256 = "c6f6b9bf204809ada7784583cc3d0930d2b56cbe42e0e87a2ef90133d9c993fe";
      };
    }
