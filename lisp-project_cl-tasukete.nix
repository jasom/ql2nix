
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tasukete-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tasukete/2017-06-30/cl-tasukete-20170630-git.tgz";
        sha256 = "7b503dc51dc43d09fd61a8796b8c6a5b4e7d5742ba7696b5d7b1098852569f07";
      };
    }
