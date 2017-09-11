
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_cmu-infix-20170227-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/cmu-infix/2017-02-27/cmu-infix-20170227-git.tgz";
        sha256 = "78f2caeb024ca827fe7b131cd7840a739a241dc11e71d08de8421551c35e3ba4";
      };
    }
