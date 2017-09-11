
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-tidy-20131111-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-tidy/2013-11-11/cl-tidy-20131111-git.tgz";
        sha256 = "32faed08df9a881cfc91b697a6489db32978eaf0c497b9f045c4f2bf99701dba";
      };
    }
