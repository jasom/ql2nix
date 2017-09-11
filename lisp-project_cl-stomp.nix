
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-stomp-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-stomp/2012-01-07/cl-stomp-20120107-git.tgz";
        sha256 = "71ebca6904694ec82552e04e6e4650ef246d34407e3e52c7d31d0e3582dd6ad9";
      };
    }
