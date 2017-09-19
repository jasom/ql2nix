
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ssl-20170830-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl+ssl/2017-08-30/cl+ssl-20170830-git.tgz";
        sha256 = "79fae515b080b6a5afa96e81452136d5d1b9afc1304827b2efffe00d00db9353";
      };
    }
