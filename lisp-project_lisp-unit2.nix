
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-unit2-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-unit2/2016-05-31/lisp-unit2-20160531-git.tgz";
        sha256 = "5ba7e239efad3e1f026c5953cfd2b31dd1ab3a48f53dce4230b484a29f67d99d";
      };
    }
