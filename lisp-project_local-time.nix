
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_local-time-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/local-time/2017-07-25/local-time-20170725-git.tgz";
        sha256 = "e92653209d89161ea4df13fbfe1dd4175106e5e7921a4e13adb2d49114e55d15";
      };
    }
