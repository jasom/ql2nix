
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-tex-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-tex/2017-08-30/plump-tex-20170830-git.tgz";
        sha256 = "c7cc949dceb92c7d68b7020f613a7f15dad8b063803aff661b226ffe179b4d65";
      };
    }
