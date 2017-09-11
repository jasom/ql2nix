
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_overlord-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/overlord/2017-07-25/overlord-20170725-git.tgz";
        sha256 = "339b5570cb69ac5818181e64cab1fa0a33037cf0f76fbbf3835c56864d46f197";
      };
    }
