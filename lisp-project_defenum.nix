
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defenum-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defenum/2017-06-30/defenum-20170630-git.tgz";
        sha256 = "20b445ea36949073fc90bd76f92ed37502b9a9a1fc419ca1225089329cefc094";
      };
    }
