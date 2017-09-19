
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_rtg-math-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/rtg-math/2017-08-30/rtg-math-20170830-git.tgz";
        sha256 = "ce954afc11f64cb2384055337d99168e32127f1470ba7a9c1d4e7875b86ce76e";
      };
    }
