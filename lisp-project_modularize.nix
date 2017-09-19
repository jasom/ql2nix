
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_modularize-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/modularize/2017-08-30/modularize-20170830-git.tgz";
        sha256 = "557975fb9f7e699ff7f5f05e69ef75df4590a413f58c8191d9488f453b845760";
      };
    }
