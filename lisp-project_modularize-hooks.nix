
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-hooks-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize-hooks/2017-06-30/modularize-hooks-20170630-git.tgz";
        sha256 = "41a0ca2b3516f7ea6373a201c376f203c03f4bb68921a0c33967c6cb5da3824c";
      };
    }
