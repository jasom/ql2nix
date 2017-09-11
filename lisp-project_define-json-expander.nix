
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_define-json-expander-20140713-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/define-json-expander/2014-07-13/define-json-expander-20140713-git.tgz";
        sha256 = "94c8c9c712282673db20523fa0ee36d55fb7abcc4cbb95bc5f4c4589a8df6ed0";
      };
    }
