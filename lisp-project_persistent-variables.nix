
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_persistent-variables-20130312-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/persistent-variables/2013-03-12/persistent-variables-20130312-git.tgz";
        sha256 = "950a6adef753c9142344e39db82617c316edea0196127a0755436aead17c03dc";
      };
    }
