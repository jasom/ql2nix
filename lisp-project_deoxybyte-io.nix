
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deoxybyte-io-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deoxybyte-io/2014-01-13/deoxybyte-io-20140113-git.tgz";
        sha256 = "ccd993868b89d447200716237cd555ff2a6d3c5c9de0334fa3821106647020e9";
      };
    }
