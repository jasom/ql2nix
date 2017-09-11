
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-markup-20120909-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-markup/2012-09-09/monkeylib-markup-20120909-git.tgz";
        sha256 = "f5ca7ff3f3f3cc9f700836d427a0bba5860ee82749055154462da6c311ce162b";
      };
    }
