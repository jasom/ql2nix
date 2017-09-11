
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scrobbler-20111105-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scrobbler/2011-11-05/cl-scrobbler-20111105-git.tgz";
        sha256 = "ce0c1afc826cedb0a6b15dd4fabe1c320bf4538efeffd69f01c7e7e2d2658784";
      };
    }
