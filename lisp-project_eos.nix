
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eos-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eos/2015-06-08/eos-20150608-git.tgz";
        sha256 = "2837ef57743f3adf57de5f69ff690a900e0b91d2da3a044b0b70849bcadb0c3a";
      };
    }
