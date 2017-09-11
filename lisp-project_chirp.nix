
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_chirp-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/chirp/2017-06-30/chirp-20170630-git.tgz";
        sha256 = "696caa15b214c0c81530efd5dc01e5911824f1ae66540bb5774d3dd12f2432c8";
      };
    }
