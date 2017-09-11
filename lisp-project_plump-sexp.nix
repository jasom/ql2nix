
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_plump-sexp-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/plump-sexp/2017-06-30/plump-sexp-20170630-git.tgz";
        sha256 = "25ff26fc6de089db69acf78839cc7c4457804f4f367ff818f7d3cb7460b11045";
      };
    }
