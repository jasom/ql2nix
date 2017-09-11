
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-hue-20150113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-hue/2015-01-13/cl-hue-20150113-git.tgz";
        sha256 = "3763e9724f328eab99ed67ca3e49ccf6bf89c4910a47ea2d5cf5b13a9155aa59";
      };
    }
