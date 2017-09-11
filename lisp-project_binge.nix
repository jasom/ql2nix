
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_binge-20150207T212203";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/binge/2015-03-02/binge-20150207T212203.tgz";
        sha256 = "cd5a76d29e095bc27b30f91cc187657c77fc51a248ea6d4d2a9b4b3b4a235694";
      };
    }
