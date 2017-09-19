
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_softdrink-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/softdrink/2017-08-30/softdrink-20170830-git.tgz";
        sha256 = "2d1834b5cfdc677184b30079ddeb8891e84af3da38c0159651cb275d25660471";
      };
    }
