
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_serapeum-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/serapeum/2017-07-25/serapeum-20170725-git.tgz";
        sha256 = "69e6a7f55adfd72f30f2187ec7973f1ae00d1741fccc8b338707138105c6ee80";
      };
    }
