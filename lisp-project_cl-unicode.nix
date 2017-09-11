
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-unicode-0.1.5";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-unicode/2014-12-17/cl-unicode-0.1.5.tgz";
        sha256 = "d690480a82bfaa8d5dba29b68bc24f13e4e485f825904e5822879a280bc6a5c9";
      };
    }
