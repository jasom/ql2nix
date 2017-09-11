
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_which-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/which/2016-04-21/which-20160421-git.tgz";
        sha256 = "5299578261a9f23cec30babf17cc5422cfad12059a493fbc89848399804b1558";
      };
    }
