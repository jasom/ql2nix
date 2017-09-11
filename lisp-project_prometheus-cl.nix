
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_prometheus-cl-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/prometheus.cl/2016-08-25/prometheus.cl-20160825-git.tgz";
        sha256 = "1f9fa0ac2c40e8b88cfcf44d003e6fb5f6d65d370cb5bc612290c257c7378c6b";
      };
    }
