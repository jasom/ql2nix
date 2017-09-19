
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_semantic-spinneret-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/semantic-spinneret/2017-08-30/semantic-spinneret-20170830-git.tgz";
        sha256 = "f3d9edd483be75ab17c46d7c9849e07f23357f909d48af2be51a61892af1a0ec";
      };
    }
