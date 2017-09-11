
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_injection-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/injection/2016-05-31/injection-20160531-git.tgz";
        sha256 = "702ff8e938a67b3bbe267b211775b122472fc24ad20e7e086cc6b01461aea16e";
      };
    }
