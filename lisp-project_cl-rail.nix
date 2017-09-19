
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rail-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rail/2017-08-30/cl-rail-20170830-git.tgz";
        sha256 = "ab77d80a552029e3d142748673aa7d6284fee8dfcc92f1f65a5ac2beccd87088";
      };
    }
