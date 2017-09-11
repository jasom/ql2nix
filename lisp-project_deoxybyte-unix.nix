
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deoxybyte-unix-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deoxybyte-unix/2014-01-13/deoxybyte-unix-20140113-git.tgz";
        sha256 = "d87e526dc00acd3a382d46de4a24f183af915559547e403cf20ce4234ec12c2a";
      };
    }
