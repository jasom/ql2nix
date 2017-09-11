
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-read-macro-tokens-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-read-macro-tokens/2015-09-23/cl-read-macro-tokens-20150923-git.tgz";
        sha256 = "40348c20057f6b7fbfa4e831b19a027652560152a1a79a1586dacd38beaa1125";
      };
    }
