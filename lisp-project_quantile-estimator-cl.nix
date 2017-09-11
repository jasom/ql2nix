
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_quantile-estimator-cl-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/quantile-estimator.cl/2016-08-25/quantile-estimator.cl-20160825-git.tgz";
        sha256 = "36df45fbe0d98d1d166cc90c5a099c41a26209caad804628c057af08ac1bbd2e";
      };
    }
