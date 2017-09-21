
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-inotify-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-inotify/2016-09-29/cl-inotify-20160929-git.tgz";
        sha256 = "944e5845d356e5c448b903000c83f17b0f8f73891376021fb0d48313081767e5";
      };
    }
