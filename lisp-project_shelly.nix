
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_shelly-20141106-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/shelly/2014-11-06/shelly-20141106-git.tgz";
        sha256 = "9953fd85cedac29284fb14b5c74fbe1a91d4800157adb37101381b84084ea4b3";
      };
    }
