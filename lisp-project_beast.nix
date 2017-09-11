
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_beast-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/beast/2017-06-30/beast-20170630-git.tgz";
        sha256 = "c99e98f39d4440c33d6c377ccd4a961870442f5f652f8a3e9536643371b4fe2e";
      };
    }
