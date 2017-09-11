
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_spartns-1.4.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/spartns/2010-12-07/spartns-1.4.3.tgz";
        sha256 = "c2415f5863f0be5bfdd5b9b2de9864ea042f9fa20bf889ce5d1862849d1a8ac7";
      };
    }
