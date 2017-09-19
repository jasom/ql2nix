
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_inquisitor-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/inquisitor/2017-08-30/inquisitor-20170830-git.tgz";
        sha256 = "78f769c3044534d1da26e32c735f10dbd0ce49b756966def7455bc8bedc63325";
      };
    }
