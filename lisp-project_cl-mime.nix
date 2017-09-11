
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mime-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mime/2016-02-08/cl-mime-20160208-git.tgz";
        sha256 = "22a92d291e5a37ff6be1c354474b898f22482ea03bf457095b6265d51d3fe908";
      };
    }
