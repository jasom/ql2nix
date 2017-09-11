
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-zmq-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-zmq/2016-02-08/lisp-zmq-20160208-git.tgz";
        sha256 = "663c8595532310f01caf232a3840f2fa2f974cb4c6e12a8dca4535e27c506207";
      };
    }
