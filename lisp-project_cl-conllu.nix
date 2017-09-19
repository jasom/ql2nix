
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-conllu-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-conllu/2017-08-30/cl-conllu-20170830-git.tgz";
        sha256 = "643aa46f890bab7c1f417fd6428d3fb176e89c3a6e4353ee523ee15f405c64b7";
      };
    }
