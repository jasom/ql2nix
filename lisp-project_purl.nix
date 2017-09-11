
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_purl-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/purl/2016-09-29/purl-20160929-git.tgz";
        sha256 = "c5d6bd5fa86dc9773b0af8016a0a375201bc0fa07e0c5c73c51ef2c0fe05e109";
      };
    }
