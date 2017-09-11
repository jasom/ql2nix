
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-dropbox-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-dropbox/2015-06-08/cl-dropbox-20150608-git.tgz";
        sha256 = "6f199b7f772cd919bbd6e4bc89540c0ae0384848cb2d2d8118c4d9558abf3821";
      };
    }
