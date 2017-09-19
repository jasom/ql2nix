
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_varjo-release-quicklisp-b46bcb0d-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/varjo/2017-08-30/varjo-release-quicklisp-b46bcb0d-git.tgz";
        sha256 = "582338cf59840514be59cff9d412d09523aa8fabe9735d9d1a60337516001f6c";
      };
    }
