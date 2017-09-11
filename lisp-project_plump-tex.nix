
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-tex-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-tex/2015-01-13/plump-tex-20150113-git.tgz";
        sha256 = "2ce795a5a2fccd88c3079c63d5ef6a9146797b6feb7ec3fffbfedbf6d1f1be64";
      };
    }
