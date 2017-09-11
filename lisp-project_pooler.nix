
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pooler-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pooler/2015-06-08/pooler-20150608-git.tgz";
        sha256 = "587fe6419bcc3c1adb557cbecc2aeecb0ca50b5e7e1eef1ffc832ab99a1fe55a";
      };
    }
