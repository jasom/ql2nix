
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_clickr-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/clickr/2014-07-13/clickr-20140713-git.tgz";
        sha256 = "d862280a497886bc27a70591cb1c61bd5013889860d73bfaea8c52f0c438fe98";
      };
    }
