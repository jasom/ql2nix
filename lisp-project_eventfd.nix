
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_eventfd-20151218-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/eventfd/2015-12-18/eventfd-20151218-git.tgz";
        sha256 = "0b2cdd9cdb1b2e79768256f529a88f9b8e0ee2c4538ce7695f8728b7d9fab8e7";
      };
    }
