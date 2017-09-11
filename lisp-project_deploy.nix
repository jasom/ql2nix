
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_deploy-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/deploy/2017-06-30/deploy-20170630-git.tgz";
        sha256 = "c335b5f7b8dfca092067b177412215e72832889d05923283e29bf7e49651d78d";
      };
    }
