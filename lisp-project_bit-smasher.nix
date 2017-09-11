
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_bit-smasher-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/bit-smasher/2017-02-27/bit-smasher-20170227-git.tgz";
        sha256 = "8487e52efaabe0e4b6abc51bd363a6e2e4d5197bbb995b69c272189f3dd0bf07";
      };
    }
