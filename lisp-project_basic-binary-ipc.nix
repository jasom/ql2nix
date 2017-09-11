
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_basic-binary-ipc-20150804-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/basic-binary-ipc/2015-08-04/basic-binary-ipc-20150804-git.tgz";
        sha256 = "7a54ccf008d918bddffda3cbaf95cb15402169cca67bb75c39161aff1a0911c8";
      };
    }
