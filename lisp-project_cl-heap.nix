
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-heap-0.1.6";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-heap/2013-03-12/cl-heap-0.1.6.tgz";
        sha256 = "914cb5000f9961610d3a2516bf80254251e55b916ce09b8d08bf5b710f587098";
      };
    }
