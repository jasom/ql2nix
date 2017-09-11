
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hash-util-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hash-util/2017-07-25/cl-hash-util-20170725-git.tgz";
        sha256 = "e4f5d488d9c01ce084aa5264b675a6729ce5a404ecdf9890bd247da5637fa298";
      };
    }
