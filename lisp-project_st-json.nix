
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_st-json-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/st-json/2015-06-08/st-json-20150608-git.tgz";
        sha256 = "c6550e740a235f6271809bf01c0c752217e99a1bc4a64435b7beb8666cdfbaec";
      };
    }
