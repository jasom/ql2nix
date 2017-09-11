
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xmls-1.7";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xmls/2015-04-07/xmls-1.7.tgz";
        sha256 = "cb001225c0393b0f34d1d9db651443fbafcac88cc9d320561660cbf2821090dd";
      };
    }
