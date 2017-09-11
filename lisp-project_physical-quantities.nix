
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_physical-quantities-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/physical-quantities/2017-07-25/physical-quantities-20170725-git.tgz";
        sha256 = "30e7d2bbce64332fef12f6b987310fef726068c9b5eb56dc440d77c95e8dd874";
      };
    }
