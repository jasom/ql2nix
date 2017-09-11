
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_http-body-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/http-body/2016-12-04/http-body-20161204-git.tgz";
        sha256 = "f1819dcb9a5495eb0af0975ed6c258d0947bf21d28bafa624a92d0a56ff4a0f8";
      };
    }
