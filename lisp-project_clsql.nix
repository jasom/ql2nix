
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clsql-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clsql/2016-02-08/clsql-20160208-git.tgz";
        sha256 = "f641b8b0b0b1a789ec67708502c15cfd3981733d44c7f80333d7aaeb683e8941";
      };
    }
