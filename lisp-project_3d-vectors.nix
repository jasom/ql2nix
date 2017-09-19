
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_3d-vectors-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/3d-vectors/2017-08-30/3d-vectors-20170830-git.tgz";
        sha256 = "a0142cd6263396fa9bee3451ed15238d323037003f72b0c215c7958f1e5cc7fb";
      };
    }
