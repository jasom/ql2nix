
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_submarine-20120909-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/submarine/2012-09-09/submarine-20120909-darcs.tgz";
        sha256 = "3504f53ac5d28ff3c97e9b24d43ae7058ff1501cac28b66bdc1c2c9242f081c5";
      };
    }
