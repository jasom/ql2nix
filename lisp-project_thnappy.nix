
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_thnappy-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/thnappy/2014-07-13/thnappy-20140713-git.tgz";
        sha256 = "704af3620a65d13d97f287b7122a85adb360ea21cb561afc6ea20114273d8566";
      };
    }
