
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-logic-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-logic/2014-12-17/cl-logic-20141217-git.tgz";
        sha256 = "8247b435dfffad8db5b37f1d1bd709254b39bb2e9a83c0fc5256520adeac9435";
      };
    }
