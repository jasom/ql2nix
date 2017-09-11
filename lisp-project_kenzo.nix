
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_kenzo-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/kenzo/2017-07-25/kenzo-20170725-git.tgz";
        sha256 = "11f6fdb26fc5fa1efbe7e427e45246f2c83f0117204accf1319c48a383971bcd";
      };
    }
