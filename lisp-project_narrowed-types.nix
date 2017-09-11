
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_narrowed-types-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/narrowed-types/2017-06-30/narrowed-types-20170630-git.tgz";
        sha256 = "d919e6028e253f6b98a25899006b6c7e0a830759c17bf0472f6fae483fc40ffa";
      };
    }
