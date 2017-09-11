
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_alexandria-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/alexandria/2017-06-30/alexandria-20170630-git.tgz";
        sha256 = "3aba94f9f45d87eb08e6593b3d6ed2c72eb11e5e02c4315bf9af68190f4a07b2";
      };
    }
