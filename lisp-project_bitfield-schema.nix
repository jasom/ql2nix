
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bitfield-schema-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bitfield-schema/2012-01-07/bitfield-schema-20120107-git.tgz";
        sha256 = "ef20847d41c13c132542223787805763e02c10480e1efa5739d80a5bef17b7a1";
      };
    }
