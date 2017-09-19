
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_acclimation-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/acclimation/2017-08-30/acclimation-20170830-git.tgz";
        sha256 = "8e539f75f25e03cb53b1a00f2e8f21e218a49d6544529967d4b8969459addc1e";
      };
    }
