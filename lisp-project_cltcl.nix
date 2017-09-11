
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cltcl-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cltcl/2016-12-04/cltcl-20161204-git.tgz";
        sha256 = "f2141d2b9cb2b5e5e2975206eebc37a148d57af69cc4a9d198baabe19b4879a5";
      };
    }
