
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ledger-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ledger/2017-02-27/cl-ledger-20170227-git.tgz";
        sha256 = "fda55df1e9e88d113ad55636a5fc80f4b369c09688fe194c05520a9724b1ea87";
      };
    }
