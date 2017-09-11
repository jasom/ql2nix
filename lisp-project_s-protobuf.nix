
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-protobuf-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-protobuf/2015-12-18/s-protobuf-20151218-git.tgz";
        sha256 = "20734150b0ccb032f474665a67f017282329b2b6789e6444af58d61f668dd315";
      };
    }
