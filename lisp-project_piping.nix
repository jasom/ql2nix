
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_piping-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/piping/2017-08-30/piping-20170830-git.tgz";
        sha256 = "da816e10c7a191be10b4dcce78b6e9f56b228e484b69fdcc2d7eabe7706ebc07";
      };
    }
