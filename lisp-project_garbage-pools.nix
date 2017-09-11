
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_garbage-pools-20130720-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/garbage-pools/2013-07-20/garbage-pools-20130720-git.tgz";
        sha256 = "05f014fd95526107af6d99a612b78292fbf3b8a6e9e2efcb04d6ab7e835ab6c5";
      };
    }
