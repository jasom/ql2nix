
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hash-table-destructuring-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hash-table-destructuring/2016-05-31/cl-hash-table-destructuring-20160531-git.tgz";
        sha256 = "51bfe297037518f5c16e0b9e368597277dcf14026846f9f58171528083c8d559";
      };
    }
