
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fast-io-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fast-io/2017-08-30/fast-io-20170830-git.tgz";
        sha256 = "cf45fbb2d163c888eec585bb7872bfdf0e032384f20e08f653887cb1bd091dd7";
      };
    }
