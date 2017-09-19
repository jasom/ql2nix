
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-file-size-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-file-size/2017-08-30/trivial-file-size-20170830-git.tgz";
        sha256 = "a4a05e8906a2a906fdac2a899c2a06ad29ec79789100c08c7f97c76f717d3b74";
      };
    }
