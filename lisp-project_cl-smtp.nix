
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-smtp-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-smtp/2016-08-25/cl-smtp-20160825-git.tgz";
        sha256 = "b0b7d22796825e5a05d73c2f208352b737582988938fbb5f3e0a15d28ddf736b";
      };
    }
