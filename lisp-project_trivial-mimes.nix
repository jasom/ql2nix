
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-mimes-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-mimes/2017-06-30/trivial-mimes-20170630-git.tgz";
        sha256 = "7d6792257602615c86afd81a75d2c8abcbccdaa2ebac85a5cb6c3a7bf831a666";
      };
    }
