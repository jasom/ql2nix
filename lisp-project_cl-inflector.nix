
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-inflector-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-inflector/2015-01-13/cl-inflector-20150113-git.tgz";
        sha256 = "4cc99b1bbc9f334f736bfcf65864f80d863aed68c09245d88f3e21c9cc66a66e";
      };
    }
