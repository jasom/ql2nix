
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gap-buffer-20120305-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gap-buffer/2012-03-05/cl-gap-buffer-20120305-hg.tgz";
        sha256 = "84fcb7364ea6c9bbe848ae87c932616296dc2006027d3113557cbc4b345ffa18";
      };
    }
