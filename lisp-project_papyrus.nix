
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_papyrus-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/papyrus/2017-06-30/papyrus-20170630-git.tgz";
        sha256 = "c2c6b4678057e674ed13c91b647e186a0c59733841f2da6eff42b32d79b6a576";
      };
    }
