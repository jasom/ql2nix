
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gendoc-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gendoc/2015-06-08/cl-gendoc-20150608-git.tgz";
        sha256 = "c187c9eb8ab0456b703b72c65c7c3c2ab29a7ec63e868f07478362f7561e5413";
      };
    }
