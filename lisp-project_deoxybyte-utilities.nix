
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deoxybyte-utilities-20140113-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deoxybyte-utilities/2014-01-13/deoxybyte-utilities-20140113-git.tgz";
        sha256 = "0d343600fc722ba650c18c11cf6d22cfc7cec137137dea154c266b39dba8feef";
      };
    }
