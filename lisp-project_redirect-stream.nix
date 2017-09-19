
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_redirect-stream-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/redirect-stream/2017-08-30/redirect-stream-20170830-git.tgz";
        sha256 = "17b4bca12434a2c1c6364b3599ae66b932d1e58482d2cd85fa3c302b486754f1";
      };
    }
