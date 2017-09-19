
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dbus-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dbus/2017-02-27/dbus-20170227-git.tgz";
        sha256 = "06d16267c223e68cc1753461a3bea670c50f02015906dd5d1e4caa805d06fb75";
      };
    }
