
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fad-0.7.4";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fad/2016-08-25/cl-fad-0.7.4.tgz";
        sha256 = "3d6d30910217d11bfcef0c2805c9c79e0946bf2696f057bd2efbe66d8c2c77ab";
      };
    }
