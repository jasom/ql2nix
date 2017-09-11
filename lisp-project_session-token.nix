
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_session-token-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/session-token/2014-11-06/session-token-20141106-git.tgz";
        sha256 = "2c784d195aefc1fe09360609dca255c13b34714142efd9e3d63b993ecc2fc4b2";
      };
    }
