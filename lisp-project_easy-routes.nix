
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_easy-routes-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/easy-routes/2017-08-30/easy-routes-20170830-git.tgz";
        sha256 = "bd6767835ab3c3105cb9ec1c7b7d99195fd111d0a164c7e137b8725826aaf085";
      };
    }
