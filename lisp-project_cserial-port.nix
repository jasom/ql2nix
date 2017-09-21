
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cserial-port-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cserial-port/2017-04-03/cserial-port-20170403-git.tgz";
        sha256 = "e157caaf8ecf2a6e27746da2c37597b5acbe99b7d82d99d919080c9034b5dfb9";
      };
    }
