
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-openid-20150407-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-openid/2015-04-07/cl-openid-20150407-git.tgz";
        sha256 = "e5ede6699b8f4f6203a2fe83feb057cd4ce146d818117f38fd0578260fc74f02";
      };
    }
