
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_meta-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/meta/2015-06-08/meta-20150608-git.tgz";
        sha256 = "b8317b6aa68a818ea3477ad28278ed94a6e3185ac987e536da9cae668d34a644";
      };
    }
