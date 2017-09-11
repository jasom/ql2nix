
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_mito-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/mito/2017-07-25/mito-20170725-git.tgz";
        sha256 = "39fd8681eeaa8fe148e693d2187b3576fd43e054ffa872858eec5a5a17cd9a1e";
      };
    }
