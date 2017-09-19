
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eazy-process-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eazy-process/2015-12-18/eazy-process-20151218-git.tgz";
        sha256 = "7361abcf59b7f39427d6a9d8b7a8f415a586dd22ab6cbd72da0a43278cfdcbbf";
      };
    }
