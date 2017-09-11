
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-lex-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-lex/2016-09-29/cl-lex-20160929-git.tgz";
        sha256 = "1fddca6cc0240e9be677318bb17825e3f23910481e907203ec4cdb9a0768c3d1";
      };
    }
