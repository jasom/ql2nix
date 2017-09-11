
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-emacs-if-20120305-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-emacs-if/2012-03-05/cl-emacs-if-20120305-git.tgz";
        sha256 = "4995cb7bfcee9331bc386028c68140a17cfef779d6f2cc6a36c838d4591ce578";
      };
    }
