
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-crc64-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-crc64/2014-07-13/cl-crc64-20140713-git.tgz";
        sha256 = "9166603ac2a820ae6a38a12969b65b3f7ba97886967bbe23c421d3f680328f87";
      };
    }
