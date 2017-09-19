
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-json-helper-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-json-helper/2017-08-30/cl-json-helper-20170830-git.tgz";
        sha256 = "1cd3beebb1983debdf207bc3a9397cc23343f70e9de8058c6902c532e7c9380f";
      };
    }
