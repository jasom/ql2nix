
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_liblmdb-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/liblmdb/2017-08-30/liblmdb-20170830-git.tgz";
        sha256 = "378bbce5a60962063c5103cf8e6be279eeb6f069301cbc840d1c81b9de33a7ff";
      };
    }
