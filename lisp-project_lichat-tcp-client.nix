
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lichat-tcp-client-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lichat-tcp-client/2017-08-30/lichat-tcp-client-20170830-git.tgz";
        sha256 = "92c37ae8a8590d3d04cb2da0942ab985f66e1546b6399ea06863b6cabe2e19c6";
      };
    }
