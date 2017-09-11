
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_ahungry-fleece-20170124-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/ahungry-fleece/2017-01-24/ahungry-fleece-20170124-git.tgz";
        sha256 = "9be959f9e9b92e19eb227f97fb1e9c85b1fe2739c2a646b177fe18ebe4112be9";
      };
    }
