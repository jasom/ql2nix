
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_jonathan-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/jonathan/2017-06-30/jonathan-20170630-git.tgz";
        sha256 = "7581c0c91d387aa505c07c370ea73c01de8ac54dc026b342e1fd198786eeb66f";
      };
    }
