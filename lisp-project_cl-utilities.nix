
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_cl-utilities-1.2.4.sb-rotate-byte.patch];
      name = "lisp-project_cl-utilities-1.2.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-utilities/2010-10-06/cl-utilities-1.2.4.tgz";
        sha256 = "07a9318732d73b5195b1a442391d10395c7de471f1fe12feedfe71b1edbd51fc";
      };
    }
