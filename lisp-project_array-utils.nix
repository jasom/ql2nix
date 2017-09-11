
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_array-utils-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/array-utils/2017-06-30/array-utils-20170630-git.tgz";
        sha256 = "eb7d9444be27f82d5e919ad5244e7c816276492852c5cd8a790d8780051744da";
      };
    }
