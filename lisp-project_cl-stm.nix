
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-stm-20101207-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-stm/2010-12-07/cl-stm-20101207-http.tgz";
        sha256 = "c60845fa11ede07d5956242f2e26ff8844c0787c564f78598ece8bd36f052a7e";
      };
    }
