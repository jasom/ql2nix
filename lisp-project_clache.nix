
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clache-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clache/2014-07-13/clache-20140713-git.tgz";
        sha256 = "409dbe9ee3bcf1f3ae5cf2df7e962f9dc2d6787925f3d65ec976aaa93517f7e1";
      };
    }
