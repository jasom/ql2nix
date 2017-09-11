
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_string-case-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/string-case/2015-12-18/string-case-20151218-git.tgz";
        sha256 = "7c39167e2e35f9e6a03376682f1c4fe3802121d02e35ba7a579dc350b567eb50";
      };
    }
