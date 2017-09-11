
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pseudonyms-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pseudonyms/2016-08-25/pseudonyms-20160825-git.tgz";
        sha256 = "64318d326b7e33d57e3e3ecfbe73e1dc848618b49aed0de6be5fa4921bc6f052";
      };
    }
