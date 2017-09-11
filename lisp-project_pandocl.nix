
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pandocl-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pandocl/2015-09-23/pandocl-20150923-git.tgz";
        sha256 = "9637acd662dbbba15f985a411d25866d26954ed09c2580850f29b6a5d4cea036";
      };
    }
