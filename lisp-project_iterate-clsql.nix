
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_iterate-clsql-20130312-http";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/iterate-clsql/2013-03-12/iterate-clsql-20130312-http.tgz";
        sha256 = "d897aa7b768cb6f12278c312b059e3bbe8894dbf362e1722378664a62e2176e1";
      };
    }
