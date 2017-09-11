
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-timers-20101006-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-timers/2010-10-06/trivial-timers-20101006-http.tgz";
        sha256 = "9e8251a292e5a2c9f3868f177db6ea803483ba25adc760f09282f8c6def24923";
      };
    }
