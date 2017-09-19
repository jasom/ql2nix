
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pgloader-v3.4.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pgloader/2017-08-30/pgloader-v3.4.1.tgz";
        sha256 = "3b7de5c86bee949d049f923f19b6f361dfe3025b7bee401f792ce5187e3bd7fc";
      };
    }
