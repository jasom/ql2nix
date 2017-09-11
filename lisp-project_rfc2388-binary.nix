
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rfc2388-binary-20170124-darcs";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rfc2388-binary/2017-01-24/rfc2388-binary-20170124-darcs.tgz";
        sha256 = "22d030a0504df737e8a41c1b965a30f76942b7de29c1a199857d133dbbece05c";
      };
    }
