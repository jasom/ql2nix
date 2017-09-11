
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mathkit-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mathkit/2016-02-08/mathkit-20160208-git.tgz";
        sha256 = "1ef1308131c38f059d646c940723b33d876b351a40267b4bdcc4e2a21d6835d8";
      };
    }
