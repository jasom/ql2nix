
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fastcgi-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fastcgi/2013-11-11/cl-fastcgi-20131111-git.tgz";
        sha256 = "64fac9de858e0a4b476583369e56c1fca32b8626f657283273efd3db8db2a8ff";
      };
    }
