
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_frpc-20151031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/frpc/2015-10-31/frpc-20151031-git.tgz";
        sha256 = "1e4eeb5e00ae70caf10b7561dc13e0328435ee29b285886ba65b86d813953557";
      };
    }
