
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_json-streams-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/json-streams/2017-06-30/json-streams-20170630-git.tgz";
        sha256 = "230fd6994831c2a6b938aa2a36543ab69bb119e5bbb6c1941c2a5ffe6264792a";
      };
    }
