
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_event-emitter-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/event-emitter/2014-11-06/event-emitter-20141106-git.tgz";
        sha256 = "664f90e4fed43f79960da5577a0309abd548009665ff32805135acddcc448fa1";
      };
    }
