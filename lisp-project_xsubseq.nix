
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_xsubseq-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/xsubseq/2017-08-30/xsubseq-20170830-git.tgz";
        sha256 = "b42a8ed44011d779b2fdc5f409195017d703f0e8cd1387e7f6f02405271fa6aa";
      };
    }
