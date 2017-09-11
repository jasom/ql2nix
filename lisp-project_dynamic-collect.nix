
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_dynamic-collect-20140713-hg";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/dynamic-collect/2014-07-13/dynamic-collect-20140713-hg.tgz";
        sha256 = "74f1bec2612544c42768e599c9f532b236f001d25b1e883640f238dffefee2cb";
      };
    }
