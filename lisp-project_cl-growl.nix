
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-growl-20161208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-growl/2016-12-08/cl-growl-20161208-git.tgz";
        sha256 = "6f34e1075ab4ad32f92328740b6d0a02f1d71ad56dddb732d02891483b8c638c";
      };
    }
