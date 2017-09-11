
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-events-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-events/2016-03-18/cl-events-20160318-git.tgz";
        sha256 = "bf12bf8020044f9d98cc61ad19d2b6ad3b99a15d51444b9f01b9f2c056912ec5";
      };
    }
