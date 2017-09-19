
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl4store-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl4store/2015-03-02/cl4store-20150302-git.tgz";
        sha256 = "f51616630b26dc02552a4ecd3ce119b8387715ba92ad8081e2df4031d8029c7c";
      };
    }
