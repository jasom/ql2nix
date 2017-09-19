
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cepl-glop-release-quicklisp-b7bff23e-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cepl.glop/2017-08-30/cepl.glop-release-quicklisp-b7bff23e-git.tgz";
        sha256 = "b51c8a1753c00c658581521364a83b85d25b4939224bc6eb8d8a5be7778210a9";
      };
    }
