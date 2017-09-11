
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ltsv-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ltsv/2014-07-13/cl-ltsv-20140713-git.tgz";
        sha256 = "e06cbefda29466d0cf89ba128dfa104c36abb47e87bc39be6721a8db2fc119bf";
      };
    }
