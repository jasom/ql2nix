
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pcg-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pcg/2017-06-30/cl-pcg-20170630-git.tgz";
        sha256 = "e18f04e3cdfa6ff300f798a21db6f8daa1b2e0ac0f486783dc79b34b1e5e3977";
      };
    }
