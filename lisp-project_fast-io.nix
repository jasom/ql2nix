
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fast-io-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fast-io/2017-06-30/fast-io-20170630-git.tgz";
        sha256 = "2fcf97d30b281935e5ff7e2af57b777fe45bbe52a21901f494915868b604e471";
      };
    }
