
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-xdg-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-xdg/2017-01-24/cl-xdg-20170124-git.tgz";
        sha256 = "253c0d085f21887ab40c52d229f3b2f1ebbd868c253684978423a5ba8ffb8923";
      };
    }
