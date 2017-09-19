
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inotify-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inotify/2015-06-08/inotify-20150608-git.tgz";
        sha256 = "8c3b42865ea3e619ddd86bfee75108eb5746bee0644ec0604135104ad190bfe3";
      };
    }
