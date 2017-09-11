
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-fond-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-fond/2017-07-25/cl-fond-20170725-git.tgz";
        sha256 = "dc849d37156cdeace6321e3024ef25e1c7c758dad9421d4e5dbcf253bb562645";
      };
    }
