
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_erudite-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/erudite/2017-06-30/erudite-20170630-git.tgz";
        sha256 = "38ebcb4ef331063a8ad95bc2f1f2bfdfa531fca528565e2efceb116bb497a2f8";
      };
    }
