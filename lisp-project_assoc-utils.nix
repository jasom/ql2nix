
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_assoc-utils-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/assoc-utils/2017-07-25/assoc-utils-20170725-git.tgz";
        sha256 = "71af4eb125c6d0ac9e390930ef5dbc40c77c66b7f082ba1917b8f7f94b7e1cad";
      };
    }
