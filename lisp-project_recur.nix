
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_recur-20120909-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/recur/2012-09-09/recur-20120909-hg.tgz";
        sha256 = "b0d864f4e65c3cd4404e4aa036d1a205995ecdff7cb44e0ac43fbc4a6ad07eee";
      };
    }
