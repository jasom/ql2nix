
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deoxybyte-gzip-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deoxybyte-gzip/2014-01-13/deoxybyte-gzip-20140113-git.tgz";
        sha256 = "55385e9c610d96cdf1aca5ff4d6e379324cbcc60e60d099e3abfc1634ee52bd4";
      };
    }
