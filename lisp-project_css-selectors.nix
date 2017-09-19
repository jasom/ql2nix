
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_css-selectors-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/css-selectors/2016-06-28/css-selectors-20160628-git.tgz";
        sha256 = "8bf0f00454b75691223ff1e45dc0b2ff1e8bd22d388c63e37964b3c253383879";
      };
    }
