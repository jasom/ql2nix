
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_immutable-struct-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/immutable-struct/2015-07-09/immutable-struct-20150709-git.tgz";
        sha256 = "d40912f26f8adc65755a8d391e4359a10f53e2a3ecf1517ed14f4b5aa6d789fe";
      };
    }
