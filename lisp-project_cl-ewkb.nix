
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ewkb-20110619-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ewkb/2011-06-19/cl-ewkb-20110619-git.tgz";
        sha256 = "390541c3c9c843049219e048a0b36d4a838e82d958da8512c620f28cda629a01";
      };
    }
