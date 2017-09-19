
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_codex-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/codex/2016-09-29/codex-20160929-git.tgz";
        sha256 = "57fbc3e104059101c84d3fbd168a8410e1f4d77307fcfd71831dfeeddc86043d";
      };
    }
