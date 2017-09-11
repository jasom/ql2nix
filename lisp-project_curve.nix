
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_curve-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/curve/2013-01-28/curve-20130128-git.tgz";
        sha256 = "0138f3b4314829cb6bf2cfb41c9aa66d5a6e6b72ea88204af053be7be7834217";
      };
    }
