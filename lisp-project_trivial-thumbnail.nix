
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-thumbnail-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-thumbnail/2017-06-30/trivial-thumbnail-20170630-git.tgz";
        sha256 = "8e824398c7c8fe69ef9d954797ec7859070282cdb57f96e248300bf9dcf8cbb3";
      };
    }
