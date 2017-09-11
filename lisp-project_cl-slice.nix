
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-slice-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-slice/2013-11-11/cl-slice-20131111-git.tgz";
        sha256 = "36f08ca9638781e83cc2007a54e4a226ad8ad47e79815bbf320014ce1db2671e";
      };
    }
