
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gtk2-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gtk2/2012-09-09/cl-gtk2-20120909-git.tgz";
        sha256 = "5c03b9f64bc52a950ffbd9ba2be6f0b60c513c93b5f88d83cc954c90c8db54c3";
      };
    }
