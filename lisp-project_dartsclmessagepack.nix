
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dartsclmessagepack-20150505-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dartsclmessagepack/2015-05-05/dartsclmessagepack-20150505-git.tgz";
        sha256 = "0d37aa80eae90575035ea843deffffb42d5628befafe0992bdf42c43aa6d3e78";
      };
    }
