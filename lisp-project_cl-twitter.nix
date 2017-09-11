
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-twitter-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-twitter/2017-06-30/cl-twitter-20170630-git.tgz";
        sha256 = "36f9c7188a54df680716fec41b99b81f49cc8916f9adc8094415cf63049808e6";
      };
    }
