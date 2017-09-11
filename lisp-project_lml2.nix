
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lml2-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lml2/2015-09-23/lml2-20150923-git.tgz";
        sha256 = "831fc14973ec793df993b84b2fbfd3663f6efe08fc245e03b7e96b504e96e6ba";
      };
    }
