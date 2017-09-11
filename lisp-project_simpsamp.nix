
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simpsamp-0.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simpsamp/2010-10-06/simpsamp-0.1.tgz";
        sha256 = "330fd2ead992f253837a1b0d0618f1d75f11e83d170211d8e89b9eba547d7274";
      };
    }
