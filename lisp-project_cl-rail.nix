
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-rail-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-rail/2017-07-25/cl-rail-20170725-git.tgz";
        sha256 = "9d4d676a8e50d36d89ce286937aadb9a2f7d8551a5a05bb5eacbc17ce7b51dfe";
      };
    }
