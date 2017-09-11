
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mssql-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mssql/2017-06-30/cl-mssql-20170630-git.tgz";
        sha256 = "be6fb798a33ceb6bb35fc4e09dcb56144f3e08b66c6d9e35b2f8a29ac6d49a6f";
      };
    }
