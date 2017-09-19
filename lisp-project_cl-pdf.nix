
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-pdf-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-pdf/2017-08-30/cl-pdf-20170830-git.tgz";
        sha256 = "1a016be0a889d0c29b7fbe5a0d69f6f4c503503bcd59156e10c19561a8999ff4";
      };
    }
