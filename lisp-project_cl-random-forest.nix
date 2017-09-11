
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-random-forest-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-random-forest/2017-07-25/cl-random-forest-20170725-git.tgz";
        sha256 = "f29a20c8ab3aedf70bfa68683a70965874950a1f67f60928e39a79a1b82d15ca";
      };
    }
