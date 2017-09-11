
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [./patches/lisp-project_quux-hunchentoot-20160208-git.uiop-reaname.patch];
      name = "lisp-project_quux-hunchentoot-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quux-hunchentoot/2016-02-08/quux-hunchentoot-20160208-git.tgz";
        sha256 = "faeb3504a11718378c613fa81d8ef70542add5ee8b6e0baf9e7e883125928771";
      };
    }
