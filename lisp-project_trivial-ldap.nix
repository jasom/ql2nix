
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_trivial-ldap-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/trivial-ldap/2017-04-03/trivial-ldap-20170403-git.tgz";
        sha256 = "2e094b85dc6789ad81cca6d66c55d1507a08781b2d1dda354058301a41f0239a";
      };
    }
