
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_yason-v0.7.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/yason/2016-02-08/yason-v0.7.6.tgz";
        sha256 = "1332170b030067e2ea7119e8a18abb7778b89fd6a2163f808d80dbbd48b0ee01";
      };
    }
