
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_policy-cond-20151218-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/policy-cond/2015-12-18/policy-cond-20151218-hg.tgz";
        sha256 = "5d9dc2c5d448c0e52387b53026e9ac872c463a1d25ff93b65c21b7afd5766108";
      };
    }
