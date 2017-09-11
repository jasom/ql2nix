
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-webkit-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-webkit/2016-02-08/cl-webkit-20160208-git.tgz";
        sha256 = "9c8ada1a339208a348ea33a0a989ef3207a8795986a8caeb148a8b4d0baa3db3";
      };
    }
