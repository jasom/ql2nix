
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_lass-flexbox-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/lass-flexbox/2016-02-08/lass-flexbox-20160208-git.tgz";
        sha256 = "87e1c32df52ff64f798d4041c1a6e202f73dc8d336cbb1d8038953c635bdf4c4";
      };
    }
