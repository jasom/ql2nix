
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_thread-comm-rendezvous-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/thread.comm.rendezvous/2012-10-13/thread.comm.rendezvous-20121013-git.tgz";
        sha256 = "2aebf53f096901c13bedfadac58e4c113cee7bb21940bb40de51c591eec815a8";
      };
    }
