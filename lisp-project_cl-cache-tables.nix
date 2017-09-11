
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-cache-tables-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-cache-tables/2017-06-30/cl-cache-tables-20170630-git.tgz";
        sha256 = "ad82c6e3f06becf2b38a4c312f2b1f049ffc19921c9200796493c4c76f562dc6";
      };
    }
