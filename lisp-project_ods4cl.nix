
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ods4cl-20101006-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ods4cl/2010-10-06/ods4cl-20101006-http.tgz";
        sha256 = "fea27e665a2a0fb6ac346b3865982b98cf0d78acb129ee9134eb79fe0285eedc";
      };
    }
