
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_parser-common-rules-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/parser.common-rules/2017-06-30/parser.common-rules-20170630-git.tgz";
        sha256 = "b816d663b68474ae8424c2ec519df97d1a75b2a80ef6b5cc392db548e1f9b137";
      };
    }
