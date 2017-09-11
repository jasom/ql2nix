
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deoxybyte-systems-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deoxybyte-systems/2014-01-13/deoxybyte-systems-20140113-git.tgz";
        sha256 = "5d30b59e401bc2322561e2f7917232b23e2bc4ef4d8ddf7424169149db1f73ed";
      };
    }
