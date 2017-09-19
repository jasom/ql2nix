
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_colleen-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/colleen/2017-08-30/colleen-20170830-git.tgz";
        sha256 = "48fcbcf6dd0ac6975a1b29f5f445f485f765f5b0981203e151c20c45e5a93d9b";
      };
    }
