
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ana-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ana/2017-08-30/cl-ana-20170830-git.tgz";
        sha256 = "8710ccee8e198782a10bdf17c927c6a067c23e08b63ea01374410ce7d1a2125e";
      };
    }
