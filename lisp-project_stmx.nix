
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_stmx-stable-e4dace56-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/stmx/2016-03-18/stmx-stable-e4dace56-git.tgz";
        sha256 = "473cc1b34aee852ff96481453beafbfc8ad5d99e2dc405cc9446c474dfdee97d";
      };
    }
