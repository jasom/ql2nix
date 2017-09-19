
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clsql-fluid-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clsql-fluid/2017-08-30/clsql-fluid-20170830-git.tgz";
        sha256 = "63c043cdac58a2d62b0157de63067f19b04db01f91fbb60a17148e6be05a0a86";
      };
    }
