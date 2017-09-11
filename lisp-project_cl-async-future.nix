
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-async-future-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-async-future/2015-01-13/cl-async-future-20150113-git.tgz";
        sha256 = "17a70dd2f22f619537af434fab1acb4a3cf8976e31775ce7ea5435bf7ff3e950";
      };
    }
