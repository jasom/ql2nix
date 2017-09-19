
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-emoji-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-emoji/2017-08-30/cl-emoji-20170830-git.tgz";
        sha256 = "6364cad7ef6b88fd5d7aebddbeb40935140fe535756da4594563613501e5829e";
      };
    }
