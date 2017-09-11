
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xlsx-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xlsx/2017-07-25/xlsx-20170725-git.tgz";
        sha256 = "d55b27443fde97149fccb89583e7f2443b6682379175f430980d866b6bc6097b";
      };
    }
