
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-opengl-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-opengl/2017-07-25/cl-opengl-20170725-git.tgz";
        sha256 = "5e1b69e602d67f3080d342685deb3b785ed77ad74135381ae6ebfc3478c8a906";
      };
    }
