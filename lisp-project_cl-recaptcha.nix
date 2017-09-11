
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-recaptcha-20150608-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-recaptcha/2015-06-08/cl-recaptcha-20150608-git.tgz";
        sha256 = "f5af0162cfcbc90851863a09bec6793ffe4c8058977349f296643fbb29f41cc4";
      };
    }
