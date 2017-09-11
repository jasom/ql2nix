
{ buildLispProject, stdenv, fetchurl, system ? builtins.currentSystem }:
let
  pkgs = import <nixpkgs> { inherit system; };
in
  buildLispProject {
      inherit stdenv;
      patches = [];
      name = "lisp-project_squirl-20160825-git";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/squirl/2016-08-25/squirl-20160825-git.tgz";
        sha256 = "b8826cfae797ec7da6493c96779ae9a8c7e1b975af2362653b3f23f4daf89151";
      };
    }
