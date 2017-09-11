
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-trie-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-trie/2017-06-30/cl-trie-20170630-git.tgz";
        sha256 = "519a4d75302887559dcae88ccf93d2bf587e83ca85dfa29a1de3f5550870fd0f";
      };
    }
