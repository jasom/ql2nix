
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_legit-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/legit/2017-06-30/legit-20170630-git.tgz";
        sha256 = "59ce229deabf26a8ddf99813cc862bfe89e67e85a345c85bafaf98eac1f7e642";
      };
    }
