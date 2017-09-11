
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ffa-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ffa/2010-10-06/ffa-20101006-git.tgz";
        sha256 = "1a0709767c17774b73e5ca4a353cc09f7e87af602b5ec980fc6d0a00af4ac2e4";
      };
    }
