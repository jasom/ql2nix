
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_doplus-20170630-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/doplus/2017-06-30/doplus-20170630-hg.tgz";
        sha256 = "de61cca7b81645bcadb0595fb7e118a34f3711f33ca52d474c9112931080eba0";
      };
    }
