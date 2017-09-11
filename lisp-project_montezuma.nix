
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_montezuma-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/montezuma/2017-02-27/montezuma-20170227-git.tgz";
        sha256 = "2e2b571c86e23854a1288f5cf784d4c4469eb090f9ccc131f5b28e02679aa7de";
      };
    }
