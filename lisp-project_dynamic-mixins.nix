
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dynamic-mixins-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dynamic-mixins/2014-11-06/dynamic-mixins-20141106-git.tgz";
        sha256 = "8f82bd9c28583991c5ae2f680e7206e49aabd2854328c87649d17f160155093a";
      };
    }
