
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clws-20130813-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clws/2013-08-13/clws-20130813-git.tgz";
        sha256 = "77329f1c1cf756cf5a5ee7fe19ff35ca4429c5a72c170b331a73ee99c7e50028";
      };
    }
