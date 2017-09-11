
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_levenshtein-1.0";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/levenshtein/2010-10-06/levenshtein-1.0.tgz";
        sha256 = "da9420c28202f94415dd8fd6308553c37ddd7811e6888f961f6c3e6727b37eeb";
      };
    }
