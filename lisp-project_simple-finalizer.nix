
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-finalizer-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-finalizer/2010-10-06/simple-finalizer-20101006-git.tgz";
        sha256 = "80180b3c90a45727d56dffca057f75355c5a3b3532d1a710ca9335de4a83cfdf";
      };
    }
