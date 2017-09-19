
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_queen-lisp-20160929-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/queen.lisp/2016-09-29/queen.lisp-20160929-git.tgz";
        sha256 = "df37d914770e769e797bd70d17a7321e28c314ff340e39862761dc4a829b496d";
      };
    }
