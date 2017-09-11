
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_with-cached-reader-conditionals-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/with-cached-reader-conditionals/2017-06-30/with-cached-reader-conditionals-20170630-git.tgz";
        sha256 = "59b0f6ac402411800eac82604f9d31243c4d1fc179f0a2a7491728e0ed38758e";
      };
    }
