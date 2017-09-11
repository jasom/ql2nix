
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_able-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/able/2012-09-09/able-20120909-git.tgz";
        sha256 = "f69c1cea6f527678e01e815a2a1629a6c78e73aaccd04373a59c120614213b85";
      };
    }
