
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fast-websocket-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fast-websocket/2015-10-31/fast-websocket-20151031-git.tgz";
        sha256 = "fed88dc9b9ff7a079f4e0e42082fdffbd3607a8e59014d0d6266d95320c3d170";
      };
    }
