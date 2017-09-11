
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_with-c-syntax-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/with-c-syntax/2016-02-08/with-c-syntax-20160208-git.tgz";
        sha256 = "6d28bbe615879f8cdb9ff3407803e1140207ca0015881515e296c977ab842dc5";
      };
    }
