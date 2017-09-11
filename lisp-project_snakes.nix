
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_snakes-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/snakes/2016-05-31/snakes-20160531-git.tgz";
        sha256 = "b002bd8708d3a2c40eae8b78c8412990fb1c935e1f5090d5c190cbc688271da5";
      };
    }
