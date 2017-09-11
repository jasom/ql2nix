
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inlined-generic-function-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inlined-generic-function/2017-04-03/inlined-generic-function-20170403-git.tgz";
        sha256 = "1592fcdbaaf8ee6d3fafad488a57ddaa75729698df7095e47481c826ed947f52";
      };
    }
