
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_spinneret-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/spinneret/2017-07-25/spinneret-20170725-git.tgz";
        sha256 = "1c18410d432ce7ec186eb46b66371c125ec2949d67bb3d45094531d67046ccd7";
      };
    }
