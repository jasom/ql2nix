
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-python-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-python/2017-06-30/cl-python-20170630-git.tgz";
        sha256 = "eecd6a479c135c4a2bfd27252d845347c47ca15c84c1c6fcc22ae8feee4a3efe";
      };
    }
