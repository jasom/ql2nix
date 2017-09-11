
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_qbook-20130312-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/qbook/2013-03-12/qbook-20130312-darcs.tgz";
        sha256 = "a104e3aded62e5625c73af45c219a9c50d4447a1a55b9230d75d9f44adb3839d";
      };
    }
