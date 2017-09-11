
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-linguist-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-linguist/2015-09-23/asdf-linguist-20150923-git.tgz";
        sha256 = "94c3513e064eaa873c8784a59dad9f986966d96baf58386c92f318685535811b";
      };
    }
