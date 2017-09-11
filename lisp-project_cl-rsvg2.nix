
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rsvg2-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rsvg2/2012-01-07/cl-rsvg2-20120107-git.tgz";
        sha256 = "223e7cee09ed18cd2f0c9d4cd49a2b7abe69afba1413dc3b85f35dd8c13788b3";
      };
    }
