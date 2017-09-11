
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dartsclhashtree-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dartsclhashtree/2015-09-23/dartsclhashtree-20150923-git.tgz";
        sha256 = "86b323f86179faa91026e6853a18ea8a90e9ebec6b1660255861999e92ac70a9";
      };
    }
