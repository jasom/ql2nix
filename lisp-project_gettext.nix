
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_gettext-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/gettext/2017-06-30/gettext-20170630-git.tgz";
        sha256 = "ddbcae576694de62f2a432f1a8a976b223367b4f76f64262be57df07a3365f6b";
      };
    }
