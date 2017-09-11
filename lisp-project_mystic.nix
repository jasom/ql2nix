
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mystic-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mystic/2016-02-08/mystic-20160208-git.tgz";
        sha256 = "d7b3ca02582920214fda4a47e072287dd2d03c63fd11d0983547ba9cb491cd7e";
      };
    }
