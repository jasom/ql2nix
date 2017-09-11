
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_swap-bytes-v1.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/swap-bytes/2016-09-29/swap-bytes-v1.1.tgz";
        sha256 = "7e227cd1e38f503717cde3cfe89ed740c3f0f4dc8f9e4a3cf1e1414caf5bdc6a";
      };
    }
