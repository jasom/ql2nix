
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mel-base-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mel-base/2017-06-30/mel-base-20170630-git.tgz";
        sha256 = "ac930f3f50eb615112649405b88a2f09d01eac019103936068017c3fa4d9ae79";
      };
    }
