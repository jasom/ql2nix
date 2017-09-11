
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-prevalence-20130720-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-prevalence/2013-07-20/cl-prevalence-20130720-hg.tgz";
        sha256 = "09c56aedfb204b8988561ad4f327609273899a3e1cc76b0511c03fd60d5ff826";
      };
    }
