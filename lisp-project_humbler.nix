
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_humbler-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/humbler/2017-06-30/humbler-20170630-git.tgz";
        sha256 = "3f62285b22b2f3572097252a499ba80f7cb74ccd7c6c0715f0545269f4307ef4";
      };
    }
