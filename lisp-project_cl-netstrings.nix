
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-netstrings-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-netstrings/2012-10-13/cl-netstrings-20121013-git.tgz";
        sha256 = "33b7037754ead2fe6576e798e700b91723b6fbad37517de4faea6eb114c7de2b";
      };
    }
