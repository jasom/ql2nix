
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-emoji-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-emoji/2017-07-25/cl-emoji-20170725-git.tgz";
        sha256 = "faa58388a0555fde67c4e229c169a23a81fc1a043da2e65802a23509a09ab365";
      };
    }
