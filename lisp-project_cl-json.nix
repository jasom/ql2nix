
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-json-20141217-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-json/2014-12-17/cl-json-20141217-git.tgz";
        sha256 = "ef048af51b714fc9072527a01102068f5efec96672801ef65d5a5a13fdbd8e01";
      };
    }
