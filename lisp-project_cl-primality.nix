
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-primality-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-primality/2015-06-08/cl-primality-20150608-git.tgz";
        sha256 = "8eb3cb28ad0d35ca752efe5e45a5474f92fa983bdf3886f1dd36af48aa941a63";
      };
    }
