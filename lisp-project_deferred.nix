
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deferred-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deferred/2017-06-30/deferred-20170630-git.tgz";
        sha256 = "52542daa797550a69b707bbbc0abc63158e3e5572f3fd5f76920502b5b901b80";
      };
    }
