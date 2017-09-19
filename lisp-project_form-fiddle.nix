
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_form-fiddle-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/form-fiddle/2017-08-30/form-fiddle-20170830-git.tgz";
        sha256 = "ebba7e6b77b05ec71e9ba68f4b93e2a6cd9b46a1ba65a61edb5c07728eedf573";
      };
    }
