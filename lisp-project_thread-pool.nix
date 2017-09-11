
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_thread-pool-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/thread-pool/2012-01-07/thread-pool-20120107-git.tgz";
        sha256 = "908bf74a5cee7b2bf2d47306236bc0085857cc2e2c3855097aa0d0ae80b1bf08";
      };
    }
