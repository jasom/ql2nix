
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_read-number-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/read-number/2016-08-25/read-number-20160825-git.tgz";
        sha256 = "a30fccc586ec4e8a8aa3e7e1d8b41657e88516c58f953f208657ff388de5f379";
      };
    }
