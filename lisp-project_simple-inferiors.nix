
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-inferiors-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-inferiors/2017-06-30/simple-inferiors-20170630-git.tgz";
        sha256 = "0e6fd7e75361c1e590e498997efebe626871825c8555008e9e91008f3386810f";
      };
    }
