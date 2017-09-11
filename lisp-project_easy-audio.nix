
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_easy-audio-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/easy-audio/2017-04-03/easy-audio-20170403-git.tgz";
        sha256 = "9f7265e744c6b307a44ab8b5c8b691742bc8fe5a9b773079014dd852efb47954";
      };
    }
