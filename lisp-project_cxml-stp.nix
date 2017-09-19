
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cxml-stp-20120520-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cxml-stp/2012-05-20/cxml-stp-20120520-git.tgz";
        sha256 = "fb2b94910e43844e4885c60d80b90641c82024ac859006c6e57c313b373fb0de";
      };
    }
