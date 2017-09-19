
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_genie-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/genie/2017-08-30/genie-20170830-git.tgz";
        sha256 = "9a8c55ef8d433eda4410d63b33fefaa628ffb1b2e359c29d6bc9de46389a1b04";
      };
    }
