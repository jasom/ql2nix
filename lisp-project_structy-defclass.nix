
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_structy-defclass-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/structy-defclass/2017-06-30/structy-defclass-20170630-git.tgz";
        sha256 = "9abbd41ce7ddcda48033789a46a8987a41c2848d548c5a386463bcfba56bb1f3";
      };
    }
