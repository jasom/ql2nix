
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lev-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lev/2015-05-05/lev-20150505-git.tgz";
        sha256 = "b497e96f08a49b51498e26dd83144188aced69c9d7c027317044cf20c4fa7352";
      };
    }
