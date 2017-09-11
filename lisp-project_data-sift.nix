
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_data-sift-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/data-sift/2013-01-28/data-sift-20130128-git.tgz";
        sha256 = "40ccaa6c41dec0aef4883dbe0bbaf218242775cfc9877a050808795da981f582";
      };
    }
