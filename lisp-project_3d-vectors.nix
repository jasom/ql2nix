
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3d-vectors-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3d-vectors/2017-07-25/3d-vectors-20170725-git.tgz";
        sha256 = "20146ae8a205426b0dc0215bfd51334ca15bd057c5e02880a1c3a84bef95a5ef";
      };
    }
