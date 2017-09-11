
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_f-underscore-20101006-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/f-underscore/2010-10-06/f-underscore-20101006-darcs.tgz";
        sha256 = "9b2b61e57d15989d8bf5eae0cd57e2bc6265b4a65890a3d5101e21a59fd81a58";
      };
    }
