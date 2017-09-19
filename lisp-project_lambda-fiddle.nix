
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lambda-fiddle-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lambda-fiddle/2017-08-30/lambda-fiddle-20170830-git.tgz";
        sha256 = "6c8d975e2333756c7e8906e6b6ce4e7edb5b1f70f575b4a55b46170f96c42484";
      };
    }
