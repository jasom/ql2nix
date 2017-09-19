
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-random-forest-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-random-forest/2017-08-30/cl-random-forest-20170830-git.tgz";
        sha256 = "29779fad7227e2292f84107852a194044adf51986ecc354c01ab0d2264ccf67a";
      };
    }
