
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clsql-helper-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clsql-helper/2015-04-07/clsql-helper-20150407-git.tgz";
        sha256 = "c5dbf5fec3eb4eb44cc2aa37f5ba998aab9cfa34d4a54160aeba3cf22d84d9cc";
      };
    }
