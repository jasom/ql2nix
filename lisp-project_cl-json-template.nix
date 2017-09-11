
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-json-template-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-json-template/2017-06-30/cl-json-template-20170630-git.tgz";
        sha256 = "134a135a61ee466df210e6610a2c165d86f9815004da989c65e2a408bc428a96";
      };
    }
