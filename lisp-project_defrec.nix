
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defrec-20130312-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defrec/2013-03-12/defrec-20130312-hg.tgz";
        sha256 = "7cfc5787ac26301117ccbe49b44400136af79821410a7380cb03d2d4e935ae04";
      };
    }
