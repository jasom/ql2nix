
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fnv-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fnv/2014-07-13/fnv-20140713-git.tgz";
        sha256 = "da2fc36bfd4beeeff4aa21cff99787db4f127f6fd42788c3a0b1370564276e61";
      };
    }
