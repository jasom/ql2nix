
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-main-thread-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-main-thread/2017-06-30/trivial-main-thread-20170630-git.tgz";
        sha256 = "0bc594725ff577cd43d56a97fad9ea4834bf2929c9c7166c7e23e94b0cc1223e";
      };
    }
