
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_smtp4cl-20150207T212034";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/smtp4cl/2015-03-02/smtp4cl-20150207T212034.tgz";
        sha256 = "c0812093e83fb601e597b92199484c12fa37e408465c90f0d542878d2bbdf90d";
      };
    }
