
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lisp-namespace-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lisp-namespace/2017-06-30/lisp-namespace-20170630-git.tgz";
        sha256 = "1634837f17f76c64b608e93959e75ab753c97443d523cd24fdd6bbcae5cfad1a";
      };
    }
