
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yaml-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yaml/2017-01-24/cl-yaml-20170124-git.tgz";
        sha256 = "a0259ff02991555b1274631ea63037ed870f4975bd9500dc55c7507b76bd375c";
      };
    }
