
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_s-xml-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/s-xml/2015-06-08/s-xml-20150608-git.tgz";
        sha256 = "38eea2fdff09ebb417b48b6e8d7087e56ade76c0b225ae2a51156bf53137c333";
      };
    }
