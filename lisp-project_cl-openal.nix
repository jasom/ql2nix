
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-openal-20150302-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-openal/2015-03-02/cl-openal-20150302-git.tgz";
        sha256 = "d4f0b2fb2368e4bff67dd878cff768bf44d1b6c2a78d761ac6f700b670e4473e";
      };
    }
