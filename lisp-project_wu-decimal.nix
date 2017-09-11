
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_wu-decimal-20130128-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/wu-decimal/2013-01-28/wu-decimal-20130128-git.tgz";
        sha256 = "7cc5dce49bad8aab0241e506c0a7a2b0a7074ae502e928864623cd71f05ad327";
      };
    }
