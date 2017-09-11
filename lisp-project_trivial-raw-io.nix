
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-raw-io-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-raw-io/2014-12-17/trivial-raw-io-20141217-git.tgz";
        sha256 = "61efe856d3b792b4b6c52e7bf7ec0a6584128e6ac5d71e536e08579505987ab4";
      };
    }
