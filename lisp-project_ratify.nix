
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ratify-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ratify/2017-08-30/ratify-20170830-git.tgz";
        sha256 = "fb8767a4049aafcfcb7fdc5a34a3c9fd512fc8258645a32c15091e795acdf976";
      };
    }
