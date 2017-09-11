
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pattern-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pattern/2014-07-13/cl-pattern-20140713-git.tgz";
        sha256 = "5b1c3947d661f542117ea7c283c9cafec968718f4fb75fe2888160261993e723";
      };
    }
