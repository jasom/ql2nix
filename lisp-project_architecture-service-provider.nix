
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_architecture-service-provider-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/architecture.service-provider/2017-06-30/architecture.service-provider-20170630-git.tgz";
        sha256 = "48d2c31149990f65abe0af4d788e6725c3fe3bd3e1f8fea4003d44c92bf681b2";
      };
    }
