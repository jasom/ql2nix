
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_weblocks-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/weblocks/2017-06-30/weblocks-20170630-git.tgz";
        sha256 = "ac3da42364844d2a926431349b6ad2e16803f2a6ef73b7d0fb1cadfccae32c80";
      };
    }
