
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_function-cache-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/function-cache/2015-05-05/function-cache-20150505-git.tgz";
        sha256 = "4e74994ea42620b05dc734a268a5e012359e3c0373a35526c384fcd822a61b28";
      };
    }
