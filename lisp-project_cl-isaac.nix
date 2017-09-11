
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-isaac-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-isaac/2015-08-04/cl-isaac-20150804-git.tgz";
        sha256 = "ca4ffe51715f97dd35fb34d1202b2bdd79909bd84685e8371b28f680c72eb07c";
      };
    }
