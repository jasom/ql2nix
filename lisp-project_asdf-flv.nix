
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-flv-version-2.1";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-flv/2016-04-21/asdf-flv-version-2.1.tgz";
        sha256 = "8c027ff2177d02641ea442782a9d96648cba12431705fc8cdf499bed3b69608a";
      };
    }
