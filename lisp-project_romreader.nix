
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_romreader-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/romreader/2014-07-13/romreader-20140713-git.tgz";
        sha256 = "15a83fa65a390e58671ca3e176d6f9275b66416e91439a176937e85e27ef2a3b";
      };
    }
