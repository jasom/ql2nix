
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-sandbox-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-sandbox/2017-06-30/cl-sandbox-20170630-git.tgz";
        sha256 = "60a0ab633418d18db6fde7eed7fec1dde2cc36be12ddfb9f9c51e7c48d854553";
      };
    }
