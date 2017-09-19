
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clods-export-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clods-export/2015-12-18/clods-export-20151218-git.tgz";
        sha256 = "fe2677c5109fb226fd71813b709a88ff1fc62f71f377117800210b6d505cf2dc";
      };
    }
