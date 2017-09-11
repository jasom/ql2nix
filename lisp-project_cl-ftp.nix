
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ftp-20150608-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ftp/2015-06-08/cl-ftp-20150608-http.tgz";
        sha256 = "d381967f110394c0f2fee33a9ccfb8c2dcfa2811dd586c8372c7afd642b86c34";
      };
    }
