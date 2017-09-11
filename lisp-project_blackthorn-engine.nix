
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_blackthorn-engine-20150608-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/blackthorn-engine/2015-06-08/blackthorn-engine-20150608-hg.tgz";
        sha256 = "7ed189d020137485ed755feb17f01733eeb8182860ba4f8d8409e8d18c60a329";
      };
    }
