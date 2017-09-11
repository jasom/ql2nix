
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize/2017-06-30/modularize-20170630-git.tgz";
        sha256 = "60b4413884e14439847d6c268e020e9a84b2c4f4d9cc3438e7864f791a53d260";
      };
    }
