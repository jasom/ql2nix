
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-battery-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-battery/2017-06-30/trivial-battery-20170630-git.tgz";
        sha256 = "4f05e8657270e2e0c4a1c296ef310cb5f326d42701739a2d9770ffa392e3c3b0";
      };
    }
