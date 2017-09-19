
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_glkit-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/glkit/2017-08-30/glkit-20170830-git.tgz";
        sha256 = "ecbfa382526d3e006a21f47a1275cdd0a21bb0d5d8bca1713444498f76782c40";
      };
    }
