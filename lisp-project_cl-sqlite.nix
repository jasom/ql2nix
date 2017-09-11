
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sqlite-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sqlite/2013-06-15/cl-sqlite-20130615-git.tgz";
        sha256 = "105333bbdccc3c2ab76ce4a35c63e6b27ac8a7a0967971c4addd666df7766135";
      };
    }
