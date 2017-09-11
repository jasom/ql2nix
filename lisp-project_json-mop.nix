
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_json-mop-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/json-mop/2017-02-27/json-mop-20170227-git.tgz";
        sha256 = "975b8309b4c9bb6d54f4e6c9a84d556fd6c5ca0d8c6635ce26dee5ea57bc2a33";
      };
    }
