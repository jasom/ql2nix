
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-password-store-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-password-store/2017-02-27/cl-password-store-20170227-git.tgz";
        sha256 = "828035bb6a2f3262f231b915c1d27f4eec935c79db5139e05f9c0da3e06ad951";
      };
    }
