
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_pettomato-deque-20120107-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/pettomato-deque/2012-01-07/pettomato-deque-20120107-git.tgz";
        sha256 = "94ce837d17e09a36aff5b6432df959742f5811b0c9e4e8a02c9a25430f363cad";
      };
    }
