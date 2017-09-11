
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_websocket-driver-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/websocket-driver/2017-07-25/websocket-driver-20170725-git.tgz";
        sha256 = "67b2de27da35ea89df2c8fdb52f58ae483ea4cae347d557289f3645624fdefe9";
      };
    }
