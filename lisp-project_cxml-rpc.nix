
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cxml-rpc-20121013-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cxml-rpc/2012-10-13/cxml-rpc-20121013-git.tgz";
        sha256 = "1cae4337c38855f32a1dc17fe4b2ef959d2d0b19bb916fce842a2cb6856203c2";
      };
    }
