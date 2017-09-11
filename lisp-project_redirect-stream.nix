
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_redirect-stream-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/redirect-stream/2017-06-30/redirect-stream-20170630-git.tgz";
        sha256 = "f0401f5c80eea6117004c26819afd01fd49bf729e2197e1060acfd844ad5b9b5";
      };
    }
