
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fomus-20120909-svn";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fomus/2012-09-09/fomus-20120909-svn.tgz";
        sha256 = "d5a13b47c30d0cd1a474e97103e68ba13d23ea3a1b5ac9488773d275c9b01c5e";
      };
    }
