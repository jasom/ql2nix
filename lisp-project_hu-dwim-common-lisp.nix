
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hu-dwim-common-lisp-20150709-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hu.dwim.common-lisp/2015-07-09/hu.dwim.common-lisp-20150709-darcs.tgz";
        sha256 = "6935f5c0cfa571874fba1dce011dcb899671e6d12747b72b4080e752e0ce9d8d";
      };
    }
