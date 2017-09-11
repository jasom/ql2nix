
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_semantic-spinneret-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/semantic-spinneret/2017-07-25/semantic-spinneret-20170725-git.tgz";
        sha256 = "90cbc7b11e9f99ace1f9bc92679ceb7ae4b39b72484125618484022a537c5c66";
      };
    }
