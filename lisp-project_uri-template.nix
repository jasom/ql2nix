
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_uri-template-1.3";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/uri-template/2012-08-11/uri-template-1.3.tgz";
        sha256 = "8fbacf423d84fd369d6fe9a3989ee436fd0800c5e1be26cb7e6db8616cd9f667";
      };
    }
