
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fn-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fn/2017-06-30/fn-20170630-git.tgz";
        sha256 = "702adcd1bfd75fe7a335fc09930ac27229f3c6eed072bd8b57ac375ab665e6ef";
      };
    }
