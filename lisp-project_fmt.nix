
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_fmt-20160318-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/fmt/2016-03-18/fmt-20160318-git.tgz";
        sha256 = "5513f5fef66f95bad4df0353328440bc11b6cb84521c74ffbda987a5b61590fd";
      };
    }
