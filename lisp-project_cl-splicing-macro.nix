
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-splicing-macro-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-splicing-macro/2014-07-13/cl-splicing-macro-20140713-git.tgz";
        sha256 = "f8556cb7054bb40d837dedfe3b5927cffd6d3f0b9d83d0957388209c1ae38046";
      };
    }
