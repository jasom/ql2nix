
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-locatives-20141106-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-locatives/2014-11-06/cl-locatives-20141106-hg.tgz";
        sha256 = "5de2719fadd87d72de2f615b334c8dfaa44ef7171047338f2a497e679025f572";
      };
    }
