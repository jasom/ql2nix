
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_horner-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/horner/2017-06-30/horner-20170630-git.tgz";
        sha256 = "41a85b992f2e5a60e3723af5a2fc6853365a9892b2eac7f39ff9644578b54a09";
      };
    }
