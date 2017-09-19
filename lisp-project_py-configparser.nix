
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_py-configparser-20170830-svn";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/py-configparser/2017-08-30/py-configparser-20170830-svn.tgz";
        sha256 = "325d2c059deaf3506f69ae7d8c71a0d5aa38a0f3f244a73a0b06676baa30c051";
      };
    }
