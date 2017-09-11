
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fs-utils-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fs-utils/2017-07-25/fs-utils-20170725-git.tgz";
        sha256 = "8d1cdbf728fb0f4b270100f1f712bd9d02300e293c15f4737f21447a0532617c";
      };
    }
