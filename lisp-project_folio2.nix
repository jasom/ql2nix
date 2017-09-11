
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_folio2-20170403-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/folio2/2017-04-03/folio2-20170403-git.tgz";
        sha256 = "00f498bc17099b38febd44a66cd2e3f51cdfa386d7d2e54f5ec3513f99adaebe";
      };
    }
