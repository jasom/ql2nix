
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_binascii-20150709-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/binascii/2015-07-09/binascii-20150709-git.tgz";
        sha256 = "26e4fae89e2d8016acd1ec1054f6a984fca597d77d754c86d8182adccf31c84b";
      };
    }
