
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_sxql-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/sxql/2017-08-30/sxql-20170830-git.tgz";
        sha256 = "db068d9e704e9c4cea08f6f5ceee3accea1f3fe97a0581ce3787589cf603850a";
      };
    }
