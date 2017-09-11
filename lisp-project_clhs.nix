
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clhs-0.6.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clhs/2015-04-07/clhs-0.6.3.tgz";
        sha256 = "48840e7288f5a9aaa09fef161b282a07ed6ef2a5072c1e34622b73c5b25bc5b2";
      };
    }
