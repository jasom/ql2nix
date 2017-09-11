
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clos-fixtures-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clos-fixtures/2016-08-25/clos-fixtures-20160825-git.tgz";
        sha256 = "1fba8921b9c4ffa949bc924c1ef07b9fc5d12233f0417541dcbdaad02d4715f8";
      };
    }
