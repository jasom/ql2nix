
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_maiden-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/maiden/2017-08-30/maiden-20170830-git.tgz";
        sha256 = "5064a427abd0874606e7311ae3de1118cc1b52e7be3d26e653492e96886f525b";
      };
    }
