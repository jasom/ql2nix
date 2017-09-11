
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_unix-opts-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/unix-opts/2017-06-30/unix-opts-20170630-git.tgz";
        sha256 = "2020a66c45d757ed68af758b43749f810292c9c08bf4dd0a6cc5eda5e228df58";
      };
    }
