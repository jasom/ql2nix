
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_defvariant-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/defvariant/2014-07-13/defvariant-20140713-git.tgz";
        sha256 = "1fd5bfead5e6dd9fe9fbedf650ed987f13f0329b7c2385ff0ccf106dae31442b";
      };
    }
