
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-intbytes-20150923-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-intbytes/2015-09-23/cl-intbytes-20150923-git.tgz";
        sha256 = "9a153b0ebaf5c8c9b420fe6d88f9df7efd9f75172e0c81a53ab301c707e7561c";
      };
    }
