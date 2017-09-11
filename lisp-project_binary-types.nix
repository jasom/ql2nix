
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_binary-types-20130615-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/binary-types/2013-06-15/binary-types-20130615-git.tgz";
        sha256 = "cc28f67386239190f6c40a947222f6cb7a44465559b5cee61172a8a1d542e4ca";
      };
    }
