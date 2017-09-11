
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_drakma-v2.0.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/drakma/2017-06-30/drakma-v2.0.3.tgz";
        sha256 = "ad7a7334f42f81524475a6473fb8f869607a608d46d2b506c0f784f744e36bf5";
      };
    }
