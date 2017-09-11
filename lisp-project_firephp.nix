
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_firephp-20160531-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/firephp/2016-05-31/firephp-20160531-git.tgz";
        sha256 = "c6fb2196fa5a98d3fc6154e35b5639bad47f33318280fff305605a0f13b0c442";
      };
    }
