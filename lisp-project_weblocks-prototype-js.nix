
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-prototype-js-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks-prototype-js/2016-09-29/weblocks-prototype-js-20160929-git.tgz";
        sha256 = "702c5ef1125c1b1ec4c0f3ff34962388de1f3de9819c57ca47569bdef9020643";
      };
    }
