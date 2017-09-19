
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-hooks-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize-hooks/2017-08-30/modularize-hooks-20170830-git.tgz";
        sha256 = "ad7bd6244e6ca323174bcaa60c712cf7c5cccaee72253c40745d994e65edebde";
      };
    }
