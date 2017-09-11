
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-ana-20170725-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-ana/2017-07-25/cl-ana-20170725-git.tgz";
        sha256 = "079ba9f0685478a815501a32a889bbfffc4a87d3785686b06ac26d32e12f76cb";
      };
    }
