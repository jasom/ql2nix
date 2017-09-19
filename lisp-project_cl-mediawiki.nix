
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mediawiki-20161204-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mediawiki/2016-12-04/cl-mediawiki-20161204-git.tgz";
        sha256 = "13b86c7111bbe1cdaf81590d0e4709b5382e1a14e5637b04d9041f46cac9b2f7";
      };
    }
