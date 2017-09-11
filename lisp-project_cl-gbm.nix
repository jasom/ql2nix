
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-gbm-20161031-git.ldpath.patch];
      name = "lisp-project_cl-gbm-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gbm/2016-10-31/cl-gbm-20161031-git.tgz";
        sha256 = "3943a5d4b458954dbe43e60449fb406f6b24e665e6d39f20d343ca4fa8f0e829";
      };
    }
