
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-yaclyaml-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-yaclyaml/2016-08-25/cl-yaclyaml-20160825-git.tgz";
        sha256 = "ac0c6ba9316b3af8c6f582bb64bf8e258cd440e411f6f63ec138c83868f8aac2";
      };
    }
