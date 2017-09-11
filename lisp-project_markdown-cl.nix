
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_markdown-cl-20170630-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/markdown.cl/2017-06-30/markdown.cl-20170630-git.tgz";
        sha256 = "1b8c0793128bfd2135c4b345175bcb93f9ba7c99af62818b57508a3348e05982";
      };
    }
