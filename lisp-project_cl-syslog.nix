
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-syslog-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-syslog/2017-01-24/cl-syslog-20170124-git.tgz";
        sha256 = "635738a7338747f91cfcf54ee2b2b6390270956f05870c1bf5135ad9d2073d70";
      };
    }
