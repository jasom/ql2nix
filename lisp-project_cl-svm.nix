
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-svm-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-svm/2011-04-18/cl-svm-20110418-git.tgz";
        sha256 = "e0b0bb04646470e999837b44d5184cc8dc412143acfd6e52f7275ae4e357d417";
      };
    }
