
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-server-manager-20131003-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-server-manager/2013-10-03/cl-server-manager-20131003-git.tgz";
        sha256 = "3f9e07508e7a821cee09fe1cb44cff366bb042d2eaf40e2c022ffbccc2ff4c15";
      };
    }
