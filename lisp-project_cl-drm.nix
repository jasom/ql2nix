
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-drm-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-drm/2016-12-04/cl-drm-20161204-git.tgz";
        sha256 = "78c3dede5ceb25671fb82b508d0bf4aca672e3794e17b079717441eee811b8c2";
      };
    }
