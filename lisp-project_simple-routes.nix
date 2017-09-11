
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_simple-routes-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/simple-routes/2017-06-30/simple-routes-20170630-git.tgz";
        sha256 = "b6e2ced7156968b9e729b1b4b10ece910a2ffecec07588c135cad8bedd6d8e59";
      };
    }
