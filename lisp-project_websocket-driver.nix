
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_websocket-driver-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/websocket-driver/2017-08-30/websocket-driver-20170830-git.tgz";
        sha256 = "c197d97e1bd94da9fdc63720e0dda21b2884b839029595d9b2e36e2b3b3a3034";
      };
    }
