
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pounds-20160208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pounds/2016-02-08/pounds-20160208-git.tgz";
        sha256 = "4cdeeebcc16225c52ac9adfc75cab034dc09a266a9416625ddf09bd9ca4acb29";
      };
    }
