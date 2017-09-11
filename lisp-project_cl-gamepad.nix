
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gamepad-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gamepad/2017-06-30/cl-gamepad-20170630-git.tgz";
        sha256 = "ceddcc2583a3e51d004fe462323e5c48454b4dbe2676d184b12c7d4cf6d137aa";
      };
    }
