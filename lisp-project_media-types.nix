
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_media-types-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/media-types/2017-06-30/media-types-20170630-git.tgz";
        sha256 = "c636e8236e52bd4fbb60b7067f30a971262ab50c3cc5fd24edf506d43066a343";
      };
    }
