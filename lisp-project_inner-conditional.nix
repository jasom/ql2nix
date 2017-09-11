
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inner-conditional-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inner-conditional/2015-06-08/inner-conditional-20150608-git.tgz";
        sha256 = "e33a200612ab231c4ded6b1b553af55eda30ac8f8ca60b15868d3285a5e374a0";
      };
    }
