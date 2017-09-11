
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-mathstats-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-mathstats/2014-07-13/cl-mathstats-20140713-git.tgz";
        sha256 = "211c65e4c5ab1a5a53ccd5461f809d7e34ae877c3ed8383e867cec717430b631";
      };
    }
