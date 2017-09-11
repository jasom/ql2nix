
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-paypal-20101006-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-paypal/2010-10-06/cl-paypal-20101006-git.tgz";
        sha256 = "58a345499905a09e6ff6bbff72faaf5bfc084f14f8947f34a8c92a6be46f167b";
      };
    }
