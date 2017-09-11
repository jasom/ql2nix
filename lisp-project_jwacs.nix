
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jwacs-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jwacs/2017-06-30/jwacs-20170630-git.tgz";
        sha256 = "728849abcfdf43e00e4e2303f07ffa55bef838c89cd170265cd38923aa95e359";
      };
    }
