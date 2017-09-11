
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-irregsexp-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-irregsexp/2016-08-25/cl-irregsexp-20160825-git.tgz";
        sha256 = "9cae68b13f22b28bb2c169fbc38b64b318f4b31fd44cbd1efad4cd1b2e6e25d3";
      };
    }
