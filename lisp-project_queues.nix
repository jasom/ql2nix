
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_queues-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/queues/2017-01-24/queues-20170124-git.tgz";
        sha256 = "59ad663177bf7fc8d5b86899768d9aa03ee019bc37925ec2a17edd08dc5a29a5";
      };
    }
