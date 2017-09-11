
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_asdf-manager-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/asdf-manager/2016-02-08/asdf-manager-20160208-git.tgz";
        sha256 = "994cf90877829e5f5589ec196698c12328999398d0c255f88686d8e583b5a7b8";
      };
    }
