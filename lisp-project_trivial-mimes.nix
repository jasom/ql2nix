
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-mimes-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-mimes/2017-08-30/trivial-mimes-20170830-git.tgz";
        sha256 = "931c23540b0dcfb0273a9812a8e1fb2aadeee97269ef8f65fedfd8a353da0446";
      };
    }
