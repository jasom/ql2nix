
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sanitize-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sanitize/2013-07-20/cl-sanitize-20130720-git.tgz";
        sha256 = "66ed7fe1eaba0118f5249fd0cdfcc52a905a12d0b185eca136c9ea909e7e0f4b";
      };
    }
