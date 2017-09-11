
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_hyperobject-20130420-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/hyperobject/2013-04-20/hyperobject-20130420-git.tgz";
        sha256 = "6a71b4abe0f9f66f84b8086798c69ca307b73c404172f20e14f34aa7f1e8fb31";
      };
    }
