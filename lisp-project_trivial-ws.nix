
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-ws-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-ws/2017-02-27/trivial-ws-20170227-git.tgz";
        sha256 = "36f86b612a8953f8e516ec1e7f77e0d21837cf34989f66baaac5253876f15595";
      };
    }
