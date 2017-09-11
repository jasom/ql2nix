
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-spaces-release-quicklisp-a606cb57-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.spaces/2017-06-30/cepl.spaces-release-quicklisp-a606cb57-git.tgz";
        sha256 = "d05c9c17eb793889561373a6d35589701e7947bbc08dec2d2885c25a84bd03d3";
      };
    }
