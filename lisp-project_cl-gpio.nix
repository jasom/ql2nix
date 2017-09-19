
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-gpio-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-gpio/2017-08-30/cl-gpio-20170830-git.tgz";
        sha256 = "a5e7e97d692c433a536861b8ef1bb82d0ac90fc956e1c62b135c64399d59a9b8";
      };
    }
