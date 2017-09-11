
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-str-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-str/2017-07-25/cl-str-20170725-git.tgz";
        sha256 = "98d4be345c8edc81f82a0b1d8dc5d3ff2d3f497c7807942dd3c59d53c52cbeb6";
      };
    }
