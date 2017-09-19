
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-junit-xml-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-junit-xml/2015-01-13/cl-junit-xml-20150113-git.tgz";
        sha256 = "0c1a8720d1f1351ed024f1e6153b4f510bcf37f516121bf6d793faf92dc369e3";
      };
    }
