
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_form-fiddle-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/form-fiddle/2017-06-30/form-fiddle-20170630-git.tgz";
        sha256 = "4eee3647b59fb6ce0df2e1d0a662424ca921042812a24030d7db40e153d49170";
      };
    }
