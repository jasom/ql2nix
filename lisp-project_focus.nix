
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_focus-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/focus/2017-04-03/focus-20170403-git.tgz";
        sha256 = "bb6f8f36c1d3fb53d1bf304cc26b08d976397bf655b39699edc8da9384c687b1";
      };
    }
