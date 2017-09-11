
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-forest-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-forest/2017-02-27/cl-forest-20170227-git.tgz";
        sha256 = "a5d246ac9fddca36da39653469d1bf330b021abf37f9b39f805a72f36bd7ac4c";
      };
    }
