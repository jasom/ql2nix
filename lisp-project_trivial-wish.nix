
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-wish-quicklisp-910afeea-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-wish/2017-06-30/trivial-wish-quicklisp-910afeea-git.tgz";
        sha256 = "deb7fc87bc380dc19ba0b89f6d99f7100aa5cb6f117856d6d5f10bff112d5c98";
      };
    }
