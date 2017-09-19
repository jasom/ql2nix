
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lichat-protocol-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lichat-protocol/2017-08-30/lichat-protocol-20170830-git.tgz";
        sha256 = "69b20a6088c21ebe65f399b07501865e330dead3bb339c52278c1620faebc08b";
      };
    }
