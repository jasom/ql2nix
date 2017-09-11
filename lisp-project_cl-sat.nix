
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sat-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sat/2016-06-28/cl-sat-20160628-git.tgz";
        sha256 = "11a1685ed8822c91918980ef4b1684ffdd28676b2a93dc3d6a058737d9f3955b";
      };
    }
