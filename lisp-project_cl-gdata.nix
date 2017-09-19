
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gdata-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gdata/2016-02-08/cl-gdata-20160208-git.tgz";
        sha256 = "7cf83b831e8c8b323c4f88a674592cb478827e3f8a71c990ba083db23a57dd16";
      };
    }
