
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-opsresearch-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-opsresearch/2017-04-03/cl-opsresearch-20170403-git.tgz";
        sha256 = "609c66505530d3b39c08f5450bffbe16848f1711a897c7f25834f47de41c7606";
      };
    }
