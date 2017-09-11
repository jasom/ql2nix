
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-emb-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-emb/2017-02-27/cl-emb-20170227-git.tgz";
        sha256 = "004d07219b3fe1a932795c96ccc026a7cae97c863bec726ef80bed01773fc90e";
      };
    }
