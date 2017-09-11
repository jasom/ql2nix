
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_global-vars-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/global-vars/2014-11-06/global-vars-20141106-git.tgz";
        sha256 = "f294843bb31144034e1370df1634dd74f24e617e3abb9c00c17927eda2ae4f2e";
      };
    }
