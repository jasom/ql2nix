
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ksuid-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ksuid/2017-07-25/cl-ksuid-20170725-git.tgz";
        sha256 = "cb75ccf3a9b80576df81893cd5490537bc6ad74657a10d210601ae0d768baab2";
      };
    }
