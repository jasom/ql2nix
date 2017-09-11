
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_monkeylib-markup-html-20120208-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/monkeylib-markup-html/2012-02-08/monkeylib-markup-html-20120208-git.tgz";
        sha256 = "0eb451cda3341c78a7854c39b55eed2ad72f741581856568038880af2da097e0";
      };
    }
