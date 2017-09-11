
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-string-template-20161031-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-string-template/2016-10-31/trivial-string-template-20161031-git.tgz";
        sha256 = "176d2ba7b9ce4dd02a7077796998135964abdb59709362a2a32c4b9f2cb8c651";
      };
    }
