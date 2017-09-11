
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hamcrest-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hamcrest/2017-06-30/cl-hamcrest-20170630-git.tgz";
        sha256 = "e28751c4a3e557805733e31da9e363a8a2bd7768360c2bc958850b954f5af432";
      };
    }
