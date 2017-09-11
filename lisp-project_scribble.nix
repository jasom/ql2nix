
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_scribble-20160628-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/scribble/2016-06-28/scribble-20160628-git.tgz";
        sha256 = "131619e3713aad84d62c48e784dcbdaf6f3cea762fa4f64b20496d6790253394";
      };
    }
