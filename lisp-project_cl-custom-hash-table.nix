
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-custom-hash-table-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-custom-hash-table/2017-06-30/cl-custom-hash-table-20170630-git.tgz";
        sha256 = "7d6df1b9498799d46316ee690ec4e4975ee65dc03b9a5bca3f30df7e9546a9c6";
      };
    }
