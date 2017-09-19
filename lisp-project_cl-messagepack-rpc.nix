
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-messagepack-rpc-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-messagepack-rpc/2016-08-25/cl-messagepack-rpc-20160825-git.tgz";
        sha256 = "d90fa45236d4b1748053a8248e8bc62f908af76d1c2550a407c7964d909b464f";
      };
    }
