
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_common-html-20160421-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/common-html/2016-04-21/common-html-20160421-git.tgz";
        sha256 = "35adc60ad3f52bc8bd25b15a7ce1ec166b2427f15960a1b32ec6286cdbf26988";
      };
    }
