
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-macro-utilities-20111203-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-macro-utilities/2011-12-03/monkeylib-macro-utilities-20111203-git.tgz";
        sha256 = "7bf8cd5a5aeb0841d11615aaf9c63373f52f37eb90d34fa6d28f01cbcc8c0888";
      };
    }
