
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_micmac-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/micmac/2015-06-08/micmac-20150608-git.tgz";
        sha256 = "31e207d17a54b85edc626e9be0d5088aab1c85529305481600c8faccb4deb4aa";
      };
    }
