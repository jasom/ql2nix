
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-messagepack-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-messagepack/2016-08-25/cl-messagepack-20160825-git.tgz";
        sha256 = "902786c1a9c71d6c959ecfab795f3b77f140a217f21d49df19ef72590b9d2bbe";
      };
    }
