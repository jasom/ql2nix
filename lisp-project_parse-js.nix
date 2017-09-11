
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parse-js-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parse-js/2016-04-21/parse-js-20160421-git.tgz";
        sha256 = "f0c334f49d18756ff0913176ed9fe9d508baf7fc10809e0fcb4ac8ec07e4a6fd";
      };
    }
