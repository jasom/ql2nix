
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clx-truetype-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clx-truetype/2016-08-25/clx-truetype-20160825-git.tgz";
        sha256 = "c7d898d8c869c67c2f216480256db669b2e10eb797f2fecc3086a7978f01be59";
      };
    }
