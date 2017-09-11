
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glsl-toolkit-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glsl-toolkit/2017-06-30/glsl-toolkit-20170630-git.tgz";
        sha256 = "e19e8f02f0d433fadcd32e21d132a45d7a07def0d3e78a1b301a9fae0221bfbc";
      };
    }
