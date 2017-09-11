
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cl-glfw3-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cl-glfw3/2017-06-30/cl-glfw3-20170630-git.tgz";
        sha256 = "ccef8db80635ecb6f1aa8618113329ebb1c08959415b806e1687396324c12c7c";
      };
    }
