
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gearman-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gearman/2015-09-23/cl-gearman-20150923-git.tgz";
        sha256 = "59ece3656e4823e754df21a98017e415ae2daa638ef6b8eecca439c8a14664b1";
      };
    }
