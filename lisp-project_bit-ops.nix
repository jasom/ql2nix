
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bit-ops-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bit-ops/2017-02-27/bit-ops-20170227-git.tgz";
        sha256 = "2740b8d9d94a72ae4a7e4f70d4ea0875ad4b02b95c82af14cd61fbae1840bfe6";
      };
    }
