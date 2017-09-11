
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_format-string-builder-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/format-string-builder/2017-01-24/format-string-builder-20170124-git.tgz";
        sha256 = "46b7e3908d29930d8870de9230592e3292acd29e0110deb47b0f608c5c973ad6";
      };
    }
