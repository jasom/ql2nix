
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-scripting-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-scripting/2017-04-03/cl-scripting-20170403-git.tgz";
        sha256 = "561ebaf1f6c1cd0f89c4f2f9f5afc637c6a704469298b37626cebb2bdfed8a84";
      };
    }
