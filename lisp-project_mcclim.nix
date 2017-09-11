
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mcclim-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mcclim/2017-07-25/mcclim-20170725-git.tgz";
        sha256 = "97680a40782a6a9f266ced8a9c03e0f186aa5bd6f4176b5be0d86ff4c2c17654";
      };
    }
