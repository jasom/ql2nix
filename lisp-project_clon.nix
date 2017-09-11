
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clon-20110320-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clon/2011-03-20/clon-20110320-git.tgz";
        sha256 = "f2d81ffa750b4e69a80b07ac0bf65f06d44df92b05fab6a04ca9bb90aac6cda3";
      };
    }
