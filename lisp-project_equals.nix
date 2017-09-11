
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_equals-20140826-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/equals/2014-08-26/equals-20140826-git.tgz";
        sha256 = "c1be2a99095e5cc628e6c7806ebd19be4acc8b95656727b0f87b8ffd21caade7";
      };
    }
