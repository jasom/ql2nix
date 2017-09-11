
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-bootstrap-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-bootstrap/2016-12-04/cl-bootstrap-20161204-git.tgz";
        sha256 = "030d6111e8b47ea2140b97de6e35cf79d9dd888265c3ffa8ed2092f335cddc6d";
      };
    }
