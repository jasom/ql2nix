
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_named-read-macros-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/named-read-macros/2017-02-27/named-read-macros-20170227-git.tgz";
        sha256 = "e9db08f1351e4f8e0a5384f317e7269732b70cd138182dfb764cc79fea7bec19";
      };
    }
