
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_utils-kt-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/utils-kt/2016-12-04/utils-kt-20161204-git.tgz";
        sha256 = "08cb6794a271e10acdb1c69d391861349cf0d5fab5f9ed0682ccfc12c865027a";
      };
    }
