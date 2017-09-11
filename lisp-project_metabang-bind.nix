
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_metabang-bind-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/metabang-bind/2017-01-24/metabang-bind-20170124-git.tgz";
        sha256 = "8c77ec6f258ebedad018f3f474c29a42246361143091b3cca35e009658f6d1f7";
      };
    }
