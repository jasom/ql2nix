
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-finalizers-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-finalizers/2017-04-03/asdf-finalizers-20170403-git.tgz";
        sha256 = "b22f0fa44b662abdab5e844b03cd104f1c391234ad3d7bd4928bc521025053f0";
      };
    }
