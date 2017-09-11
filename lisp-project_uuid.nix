
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_uuid-20130813-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/uuid/2013-08-13/uuid-20130813-git.tgz";
        sha256 = "0e8657bdf7ad131641f6d878f953ebf74d3cda06b8be99dd8bb8cffbe34308de";
      };
    }
