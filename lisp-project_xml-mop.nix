
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xml-mop-20110418-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xml-mop/2011-04-18/xml-mop-20110418-git.tgz";
        sha256 = "63bc260ce2d452ab5d4e7e0a91004a809fb06a8d0425f0ceefe10c3b7b1352a1";
      };
    }
