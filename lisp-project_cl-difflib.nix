
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-difflib-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-difflib/2013-01-28/cl-difflib-20130128-git.tgz";
        sha256 = "a6ea493c286f9ea71182f6d438a155a2ba5676802ae0b00f03a98f54ab05ebad";
      };
    }
